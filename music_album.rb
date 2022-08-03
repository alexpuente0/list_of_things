require 'json'
require './item'
require_relative './genre'

class MusicAlbum < Item
  attr_accessor :on_spotify

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
                      archived: g.archived, on_spotify: a.on_spotify }
    end
    album_db = File.new('album.json', 'w')
    album_db.write(JSON.generate(json_array))
    album_db.close
  end

  def album_list
    MusicAlbum.albums.each do |album|
      puts album
    end
  end

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

  private

  def can_be_archived?
    super() && @on_spotify
  end
end

def save_albums
  MusicAlbum.save_albums
end
