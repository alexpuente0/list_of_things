require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  @@games = []
  def initialize(genre, author, label, publish_date,
                 multiplayer, last_played_at, archived)
    super(publish_date, archived: archived)
    @genre = genre
    @author = author
    @label = label
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    @@games << self
  end

  def self.games
    @@games
  end

  private

  def can_be_archived?
    super() && ((DateTime.now - @last_played_at) / 365).floor > 2
  end
end

def list_all_games
  Game.games.each do |game|
    puts "Title: #{game.label.title}. color: #{game.label.color}"
  end
end

def add_game(genre, author, label)
  puts "pleas enter publish data :"
  publish_date=gets.chomp,
  puts "Multi player :"
  multiplayer=gets.chomp,
  puts "Last played at :"
  last_played_at=gets.chomp,
  puts "archived: [Y/N] :"
  archived=gets.chomp.upcase=='Y':true:false
  Game.new(genre, author, label,
    publish_date, multiplayer,
    last_played_at, archived)
end
