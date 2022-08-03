require 'json'
class Genre
  attr_accessor :name, :items
  attr_reader :id

  @@genres = []

  def initialize(id=nil,name)
    @id = id||rand(0..100_000)
    @name = name
    @items = []
    @@genres << self
  end
# use setter for the genre

  def self.save_genres
    json_array = []
    @@genres.each do |e|
      json_array << {id: e.id, name: e.name}
    end
    p json_array
    genre_db = File.new('genre.json', 'w')
    genre_db.write(JSON.generate(json_array))
    genre_db.close
  end

  def add_item(item)
    (@items << item) && item.genre=self unless @items.include? item
  end

  def self.genres
    @@genres
  end
# make the list_all_genres an instance method so we can call it without instantiating the music class object
  def self.list_all_genres
    Genre.genres.each do |genre|
# update the put statement
      puts "Id: #{genre.id}, Name: #{genre.name}"
    end
  end
end

=begin add list album method
creating a method just to make is concistent.
=end
def list_all_genres
   Genre.list_all_genres
end

# initial genrs
def save_genres
  Genre.save_genres
end


def load_geners
  return [] unless File.exist?('./genre.json')

  file = File.open('./genre.json')
  read_file = File.read(file)
  read_json = JSON.parse(read_file)

  loaded_genres = []

  read_json.each do |genre|
    loaded_genres.push(Genre.new(id=genre['id'],genre['name']))
  end
end

# Genre.new('Fantasy')
# Genre.new('Comedy')
# Genre.new('Fairy Tales')
# Genre.new('Legends')
# Genre.new('Scientific')
# Genre.new('Horror')
# Genre.new('Mystery')
