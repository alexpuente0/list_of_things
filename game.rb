require 'json'
require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  @@games = []
  def initialize(genre, author, label, publish_date,
                 multiplayer, last_played_at, archived)
    super(publish_date, archived: archived)
    @genre = genre
    add_author(author)
    @label = label
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    @@games << self
  end

  def self.games
    @@games
  end

  def self.save_games
    json_array = []
    @@games.each do |g|
      json_array << { gid: g.gener.id, aid: g.author.id,
                      lid: g.label.id, pd: g.publish_date, mp: g.multiplayer,
                      lp_at: g.last_played_at, archived: g.archived }
    end
    game_db = File.new('game.json', 'w')
    game_db.write(JSON.generate(json_array))
    game_db.close
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
  puts 'pleas enter publish data :'
  publish_date = gets.chomp
  puts 'Multi player :'
  multiplayer = gets.chomp
  puts 'Last played at :'
  last_played_at = gets.chomp
  puts 'archived: [Y/N] :'
  archived = gets.chomp.upcase == 'Y'
  Game.new(genre, author, label,
           publish_date, multiplayer,
           last_played_at, archived)
end

def save_games
  Game.save_games
end
