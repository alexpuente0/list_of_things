require 'date'

class Item
  attr_accessor :publish_date, :genre, :author, :label, :archived

  def initialize(publish_date, archived: false)
    @id = rand(0..100_000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @genre.add_item self
    @author.add_item self
    @label.add_item self
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end

  private

  def can_be_archived?
    return true if ((DateTime.now - @publish_date) / 365).floor > 10
  end
end
