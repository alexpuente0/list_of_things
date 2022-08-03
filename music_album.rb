require_relative "genre"
require_relative "label"
require_relative "author"
require 'json'
require './item'
require_relative './genre'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :id

  @@albums = []

  def initialize(genre, author, label, publish_date, archived, on_spotify)
    super(publish_date, archived: archived)
    @genre = genre
    @author = author
    @label = label
    @on_spotify = on_spotify
    @@albums << self
  end

  def self.albums
    @@albums
  end

  def self.save_albums
    json_array = []
    @@albums.each do |a|
      json_array << { gid: a.genre.id, aid: a.author.id,
                      lid: a.label.id, pd: a.publish_date,
                      archived: a.archived, on_spotify: a.on_spotify }
    end
    album_db = File.new('album.json', 'w')
    album_db.write(JSON.generate(json_array))
    album_db.close
  end

  def self.album_list
    MusicAlbum.albums.each do |album|
      puts "Author name: #{album.author.first_name},
            On spotify: #{album.on_spotify},
            Genre: #{album.genre.name}"

    end
  end


  private

  def can_be_archived?
    super() && @on_spotify
  end
end
=begin add list album method
creating a method just to make is concistent.
=end
def list_all_music_albums
  MusicAlbum.album_list
end

# I have taken this method out of the class

def add_album(genre, author, label)
    p 'Insert published date: '
    publish_date = gets.chomp
    p 'archived [y/n]: '
    archived = gets.chomp.downcase == 'y'
    p 'Is this song available on Spotify [y/n]: '
    on_spotify = gets.chomp.downcase == 'y'

    MusicAlbum.new(genre, author, label,
                   publish_date, archived, on_spotify)
end

def save_albums
  MusicAlbum.save_albums
end


def load_album
  return [] unless File.exist?('./album.json')

  file = File.open('./album.json')
  read_file = File.read(file)
  read_json = JSON.parse(read_file)

  loaded_books = []

  read_json.each do |album|
    loaded_books.push(
      MusicAlbum.new(
      Genre.genres.select {|genre| album['gid']==genre.id}[0],
      Author.authors.select {|author| album['aid']==author.id}[0],
      Label.labels.select {|label| album['lid']==label.id}[0],
      album['pd'], album['archived'], album['on_spotify']))
  end
end
