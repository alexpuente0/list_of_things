require_relative '../music_album'
require_relative '../genre'
require_relative '../author'
require_relative '../label'
require 'date'

describe MusicAlbum do
  before :each do
    @author = Author.new('Arturo', 'Hermida')
    @label = Label.new('title', 'color')
    @genre = Genre.new('Rock')
    @album = MusicAlbum.new(@genre, @author, @label, '2018-12-05', false)
  end

  describe 'music' do
    it 'Should return a music object' do
      expect(@album).to be_an_instance_of(MusicAlbum)
    end
    it 'Should have' do
      expect(@album.genre.name).to eq('Rock')
      expect(@album.author.first_name).to eq('Arturo')
      expect(@album.author.last_name).to eq('Hermida')
      expect(@album.label.title).to eq('title')
      expect(@album.label.color).to eq('color')
      expect(@album.publish_date).to eq(Date.parse('2018-12-05'))
    end
  end
end
