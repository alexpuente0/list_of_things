require_relative "book"
require_relative "music_album"
require_relative "game"
require_relative "genre"
require_relative "label"
require_relative "author"

def parameters(item_name)
  puts "select the 'id' for genre of the #{item_name}"
  list_all_genres
  genre_id=gets.chomp.to_i
  puts "select the 'id' for author of the #{item_name}"
  list_all_authors
  author_id=gets.chomp.to_i
  puts "select the 'id' for label of the #{item_name}"
  list_all_labels
  label_id=gets.chomp.to_i
  genre=Genre.genres.select {|genre| genre.id==genre_id}
  author=Author.authors.select {|author| author.id==author_id}
  label=Label.labels.select {|label| label.id==label_id}
  throw "we couldn't found seleted profiles with provided id" unless genre&&author&&label
  [genre[0],author[0],label[0]]
end

def save_everything
  save_authors
  save_albums
  save_books
  save_games
  save_labels
  save_genres
end

def load_everything
  load_books
  load_labels
end