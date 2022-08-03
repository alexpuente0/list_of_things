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

# test_a = Book.new('genGenre', 'genAuthor', 'ddd', '24/12/2000', 'genPublisher', 'bad')
# test_b = Book.new('erhga', 'eddd', 'hhhhhhh', '24/12/2000', 'genPublisher', 'good')

# list_all_books

# add add book method

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
