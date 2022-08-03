require_relative 'genre'
require_relative 'label'
require_relative 'author'
require 'json'
require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  @@games = []
  def initialize(genre, author, label, publish_date,
                 multiplayer, last_played_at)
    @genre = genre
    @author = author
    @label = label
    super(publish_date)
    @multiplayer = multiplayer.upcase == 'Y'
    @last_played_at = Date.parse(last_played_at)
    @@games << self
  end

  def self.games
    @@games
  end

  def self.save_games
    json_array = []
    @@games.each do |g|
      json_array << { gid: g.genre.id, aid: g.author.id,
                      lid: g.label.id, pd: g.publish_date, mp: g.multiplayer,
                      lp_at: g.last_played_at }
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

# make the llist_all_games an instance method so we can call it without instantiating the music class object
def self.list_all_games
  Game.games.each do |game|
    puts "
    Multiplayer: #{game.multiplayer},
    Label: #{game.label.title},
    Last Played on: #{game.last_played_at}
    "
  end
end

def add_game(genre, author, label)
  puts 'pleas enter publish data :'
  publish_date = gets.chomp
  puts 'Multi player? [Y/N] :'
  multiplayer = gets.chomp
  puts 'Last played at :'
  last_played_at = gets.chomp
  Game.new(genre, author, label,
           publish_date, multiplayer,
           last_played_at)
end

def save_games
  Game.save_games
end

def list_all_games
  Game.list_all_games
end

def load_games
  return [] unless File.exist?('./game.json')

  file = File.open('./game.json')
  read_file = File.read(file)
  read_json = JSON.parse(read_file)

  loaded_games = []

  read_json.each do |game|
    loaded_games.push(
      Game.new(
        Genre.genres.select { |genre| game['gid'] == genre.id }[0],
        Author.authors.select { |author| game['aid'] == author.id }[0],
        Label.labels.select { |label| game['lid'] == label.id }[0],
        game['pd'], game['mp'] ? 'Y' : 'N', game['lp_at']
      )
    )
  end
end
