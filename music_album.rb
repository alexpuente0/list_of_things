require './item'

class MusicAlbun < Item
  attr_accessor :on_spotify

  def initialize(genre, author, label, publish_date, archived, on_spotify)
    super(publish_date, archived: archived)
    @genre = genre
    @author = author
    @label = label
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?; end
end
