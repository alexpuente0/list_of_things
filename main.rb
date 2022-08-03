require_relative "book"
require_relative "music_album"
require_relative "game"
require_relative "genre"
require_relative "label"
require_relative "author"
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
    puts '9-Add a game'
    puts '8-Add a music album'
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
    puts 'press Enter to continue :'
    gets.chomp
  end
end

main
