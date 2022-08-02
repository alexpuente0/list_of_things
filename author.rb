require "json"
class Author
  attr_accessor :first_name, :last_name
  attr_reader :id
  @@authors = []

  def initialize(first_name, last_name, id: nil)
    id ||= rand(0..100_000)
    throw 'Id is taken: pleas try again' if id_taken?(id)
    @items = []
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

  def self.save_authors
    json_array=[]
    @@authors.each do |a|
      json_array << [ a.id,a.first_name, a.last_name]
    end
    p json_array
    author_db=File.new('author.json','w')
    author_db.write(JSON.generate(json_array))
    author_db.close
  end
  private

  def id_taken?(id)
    @@authors.index { |author| author.id == id }
  end
end

def list_all_authors
  Author.authors.each do |author|
    puts "First Name: #{author.first_name}. Last Name: #{author.last_name}"
  end
end

def save_authors
  Author.save_authors
end

author1 = Author.new('Tadesse', 'Alemayehu')
author2 = Author.new('Tadesse1', 'Alemayehu1')
author3 = Author.new('Tadesse3', 'Alemayehu3')
author2 = Author.new('Tadesse1', 'Alemayehu1',id: 12)
list_all_authors
save_authors
