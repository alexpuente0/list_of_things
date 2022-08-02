require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(publish_date, archived: false)
    @id = rand(0..100_000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
    author.add_item self
  end

  def add_label(label)
    @label = label
  end
  
  private

  def can_be_archived?
    return true if ((DateTime.now - @publish_date) / 365).floor > 10
  end
end
