require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :archived

  def initialize(publish_date, archived: false)
    @id = rand(0..100_000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
# add setter with an add_item method call
  def genre=(genre)
    @genre = genre
    genre.add_item self
  end

  def author=(author)
    @author = author
    author.add_item self
  end

  def label=(label)
    @label = label
    label.add_item self
  end

  private

  def can_be_archived?
    return true if ((DateTime.now - @publish_date) / 365).floor > 10
  end
end
