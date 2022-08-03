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
# use setter for the gener
  def add_item(item)
    (@items << item) && item.gener=self unless @items.include? item
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
Genre.new('Fantasy')
Genre.new('Comedy')
Genre.new('Fairy Tales')
Genre.new('Legends')
Genre.new('Scientific')
Genre.new('Horror')
Genre.new('Mystery')
