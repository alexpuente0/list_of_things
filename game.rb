require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, label, publish_date,
                 multiplayer, last_played_at, archived)
    super(publish_date, archived: archived)
    @genre = genre
    @author = author
    @label = label
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  private
  def can_be_archived?
    super()&&((DateTime.now - @last_played_at) / 365).floor>2
  end
end
