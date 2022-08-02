require_relative './item'

class Book < Item
attr_accessor :publisher, :cover_state, :archived

@@books= []

  def initialize(genre, author, label, publish_date, publisher, cover_state, archived: false)
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
    return true if super == true || @cover_state == 'bad'

    false
  end
end

  def list_all_books
    Book.books.each do |book|
      print "
      publish_date: #{book.publish_date}
      archived: #{book.archived}
      publisher : #{book.publisher}
      cover_state: #{book.cover_state}
      "
    end
  end


test1 = Book.new('genGenre','genAuthor','genLabel','24/12/2020','genPublisher','bad')
test2 = Book.new('erhga','eddd','hhhhhhh','24/12/2020','genPublisher','new')
test3 = Book.new('tteht','gtggg','XXX','23/12/2020','genPublisher','bad')
test4 = Book.new('3+36','hhvvh','rererere','22/12/2000','genPublisher','missing')
test5 = Book.new('trwhstrb','erererr','qqqq','21/12/2004','genPublisher','bad')

list_all_books()