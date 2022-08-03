require 'json'
class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  @@authors = []

  def initialize(id = nil, first_name, last_name)
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
    json_array = []
    @@authors.each do |a|
      json_array << { id: a.id, first_name: a.first_name, last_name: a.last_name }
    end
    author_db = File.new('author.json', 'w')
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
    puts "Id: #{author.id}, First Name: #{author.first_name}, Last Name: #{author.last_name}"
  end
end

def save_authors
  Author.save_authors
end

def load_authors
  return [] unless File.exist?('./author.json')

  file = File.open('./author.json')
  read_file = File.read(file)
  read_json = JSON.parse(read_file)

  loaded_authors = []

  read_json.each do |author|
    loaded_authors.push(Author.new(id = author['id'], author['first_name'], author['last_name']))
  end
end
