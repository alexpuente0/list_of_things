require 'date'
require_relative '../game'
require_relative '../author'
require_relative '../label'
describe Author do
  context 'check for data type and value' do
    before(:each) do
      @author = Author.new('Tadesse', 'Alemayehu')
      @genre = Genre.new('fantasy')
      @label = Label.new('title', 'color')
      @game = Game.new(@genre, @author, @label, '2000-12-05',
                       'y', '2015-12-05')
    end
    it 'Assert add_item is called for gener, author and label objects' do
      expect(@author).to receive(:add_item)
      expect(@genre).to receive(:add_item)
      expect(@label).to receive(:add_item)
      @game = Game.new(@genre, @author, @label, '2000-12-05',
                       'y', '2015-12-05')
    end
    it 'assert game property have the right value' do
      expect(@game.author.first_name).to eq('Tadesse')
      expect(@game.author.last_name).to eq('Alemayehu')
      expect(@game.publish_date).to eq(Date.parse('2000-12-05'))
      expect(@game.last_played_at).to eq(Date.parse('2015-12-05'))
    end
  end
end
