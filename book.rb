require 'json'
require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state, :archived

  @@books = []

  def initialize(genre, author, label, publish_date, publisher, cover_state)
    super(publish_date)
    @genre = genre
    @author = author
    @label = label
    @publisher = publisher
    @cover_state = cover_state
    @@books << self
  end

  def self.books
    @@books
  end

  def self.books(item)
    @@books = item
  end

  def self.save_books
    json_array = []
    Book.books.each do |bk|
      json_array << { genre: bk.genre, author: bk.author,
                      label: bk.label, publish_dt: bk.publish_date,
                      publisher: bk.publisher, cover_st: bk.cover_state }
    end
    book_db = File.new('book.json', 'w')
    book_db.write(JSON.generate(json_array))
    book_db.close
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'
  end
end

def list_all_books
  Book.books.each do |book|
    print "
      publish_date: #{book.publish_date}
      archived: #{book.archived}
      publisher: #{book.publisher}
      cover_state: #{book.cover_state}
      "
  end
end

def add_book(genre, author, label)
  puts 'Insert published date: '
  publish_date = gets.chomp
  puts 'Insert publisher: '
  publisher = gets.chomp
  puts 'Insert cover state:  '
  cover_state = gets.chomp
  Book.new(genre, author, label,
           publish_date, publisher, cover_state)
end

def save_books
  Book.save_books
end

def load_books
  return [] unless File.exist?('./book.json')

  file = File.open('./book.json')
  read_file = File.read(file)
  read_json = JSON.parse(read_file)

  loaded_books = []

  read_json.each do |book|
    loaded_books.push(Book.new(book['genre'], book['author'], book['label'], book['publish_dt'], book['publisher'],
                               book['cover_st']))
  end

  file.close
  Book.books(loaded_books)
end

# add_book('scyfi', 'tolkien', 'red')

# test_a = Book.new('genGenre', 'genAuthor', 'ddd', '24/12/2000', 'genPublisher', 'bad')
# test_b = Book.new('erhga', 'eddd', 'hhhhhhh', '24/12/2000', 'genPublisher', 'good')

# list_all_books
