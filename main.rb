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
      p 'not implemented yet'
    when '2'
      p 'not implemented yet'
    when '3'
      p 'not implemented yet'
    when '4'
      p 'not implemented yet'
    when '5'
      p 'not implemented yet'
    when '6'
      p 'not implemented yet'
    when '7'
      p 'not implemented yet'
    when '8'
      p 'not implemented yet'
    when '9'
      p 'not implemented yet'
    when '10'
      exit
    end
  end
end

main
