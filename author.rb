class Author
  attr_accessor :first_name, :last_name

  @@authors = []

  def initialize(first_name, last_name, id: nil)
    id ||= rand(0..100_000)
    @items = []
    throw 'Id is taken: pleas try again' if id_taken?(id)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @@authors << self
  end

  def add_item(item)
    @items << item unless @items.include? item
    item.author = self
  end

  def self.authors
    @@authors
  end

  private

  def id_taken?(id)
    @items.index { |item| item.author.id == id }
  end
end

def list_all_authors
  Author.authors.each do |author|
    puts "First Name: #{author.first_name}. Last Name: #{author.last_name}"
  end
end

# author1 = Author.new('Tadesse', 'Alemayehu')
# author2 = Author.new('Tadesse1', 'Alemayehu1')
# author3 = Author.new('Tadesse3', 'Alemayehu3')
# list_all_authors
