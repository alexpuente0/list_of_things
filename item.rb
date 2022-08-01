require 'date'

class Item
  attr_accessor :genre,:author,:label,:publish_date
  def initialize(publish_date,archived: false)
    @id=rand(0..100000)
    @publish_date=Date.parse(publish_date)
  end

  def genre(genre)
    @genre = genre
  end

  def author(author)
    @author = author
  end

  def label(label)
    @label = label
  end
  
  def move_to_archive
    @archived = true if can_be_archived? == true
  end
  
  private

  def can_be_archived?
    return true if ((DateTime.now - @publish_date)/365).floor() > 10
  end
  
end

