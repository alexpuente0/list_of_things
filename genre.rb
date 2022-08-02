class Genre
  attr_accessor :name, :items

  @@genres = []

  def initialize(name)
    @id = rand(0..100_000)
    @name = name
    @items = []
    @@genres << self
  end

  def add_item(item)
    (@items << item) && item.add_genre(self) unless @items.include? item
  end

  def self.genres
    @@genres
  end

  def list_all_genres
    Genre.genres.each do |genre|
      puts genre
    end
  end
end
