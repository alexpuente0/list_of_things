require_relative "book"
require_relative "music_album"
require_relative "game"
require_relative "genre"
require_relative "label"
require_relative "author"
def main
  puts "Welcome to my catalog!\n\n"
  response = nil
  while response != '10'
    puts "Please choose an option by entering a number\n\n"
    p '1-List all books'
    p '2-List all music albums'
    p '3-List of games'
    p '4-List all genres'
    p '5-List all labels '
    p '6-List all authors '
    p '7-Add a book'
    p '8-Add a music album'
    p '9-Add a game'
    p 'type 10 to exit'

    response = gets.chomp

    case response
    when '1'
      list_all_books
    when '2'
      list_all_music_albums
    when '3'
      list_all_games
    when '4'
      list_all_genres
    when '5'
     list_all_label
    when '6'
      list_all_authors
    when '7'
      p '7not implemented yet'
    when '8'
      p '8not implemented yet'
    when '9'
      p '9not implemented yet'
    when '10'
      exit
    end
  end
end

main
