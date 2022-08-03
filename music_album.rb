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
# make the album list an instance method so we can call it without instantiating the music class object
  def self.album_list
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
=begin add list album method
creating a method just to make is concistent.
=end
def list_all_music_albums
  MusicAlbum.album_list
end
