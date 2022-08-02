class Genre
  attr_accessor :name

  @@genres = []

  def initialize(name)
    @id = rand(0..100_000)
    @name = name
    @items = []
    @@genres << self
  end

  def add_item(item)
    @items << item unless @items.include? item
    item.genre = self
  end

  def self.genres
    @@genres
  end
end
