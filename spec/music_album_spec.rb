require_relative '../music_album'
require_relative '../genre'
require 'date'

describe MusicAlbun do
  before :each do
    @genre = Genre.new('Rock')
    @album = MusicAlbun.new(@genre, 'Bon Jovi', 'label', '2018-12-05', false, false)
  end

  describe 'music' do
    it 'Should return a music object' do
      expect(@album).to be_an_instance_of(MusicAlbun)
    end
    it 'Should have' do
      expect(@album.genre.name).to eq('Rock')
      expect(@album.author).to eq('Bon Jovi')
      expect(@album.label).to eq('label')
      expect(@album.publish_date).to eq(Date.parse('2018-12-05'))
    end
  end
end
