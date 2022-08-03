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
# make the list_all_genres an instance method so we can call it without instantiating the music class object
  def self.list_all_genres
    Genre.genres.each do |genre|
      puts genre
    end
  end
end

=begin add list album method
creating a method just to make is concistent.
=end
def list_all_genres
   Genre.list_all_genres
end
