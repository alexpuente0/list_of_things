require_relative "app"
def main
  puts "Welcome to my catalog!\n\n"
  response = nil
# change "p" with "puts" because p prints the quotes also
  while response != '10'
    puts "*************************************************"
    puts "Please choose an option by entering a number\n\n"
    puts '1-List all books'
    puts '2-List all music albums'
    puts '3-List of games'
    puts '4-List all genres'
    puts '5-List all labels '
    puts '6-List all authors '
    puts '7-Add a book'
    puts '8-Add a music album'
    puts '9-Add a game'
    puts 'type 10 to exit'
    puts "*************************************************"

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
     list_all_labels
    when '6'
      list_all_authors
    when '7'
      genre, author, label=parameters("book")
      add_book(genre, author, label)
    when '8'
      genre, author, label=parameters("album")
      add_album(genre, author, label)
    when '9'
      genre, author, label=parameters("game")
      add_game(genre, author, label)
    when '10'
      exit
    end
    puts 'press Enter to continue :'
    gets.chomp
  end
end

main
