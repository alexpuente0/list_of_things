require 'json'
class Genre
  attr_accessor :name, :items
  attr_reader :id

  @@genres = []

  def initialize(name)
    @id = rand(0..100_000)
    @name = name
    @items = []
    @@genres << self
  end

  def self.save_albums
    json_array = []
    @@genres.each do |e|
      json_array << [e.id, e.name]
    end
    p json_array
    genre_db = File.new('genre.json', 'w')
    genre_db.write(JSON.generate(json_array))
    genre_db.close
  end

  def add_item(item)
    (@items << item) && item.add_genre(self) unless @items.include? item
  end

  def self.genres
    @@genres
  end

  private

  def list_all_genres
    Genre.genres.each do |genre|
      puts `id: #{genre.id}
            gengre: #{genre.name}`
    end
  end
end

def save_genres
  Genre.save_genres
end

list_all_genres
save_genres
