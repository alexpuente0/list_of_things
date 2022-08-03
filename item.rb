require 'date'

class Item
  attr_accessor :publish_date, :genre, :author, :label, :archived

  def initialize(publish_date)
    @id = rand(0..100_000)
    @publish_date = Date.parse(publish_date)
    @genre.add_item self
    @author.add_item self
    @label.add_item self
    move_to_archive
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    ((DateTime.now - @publish_date) / 365).floor > 10
  end
end
