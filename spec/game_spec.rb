require 'date'
require_relative '../game'
require_relative '../author'
describe Author do
  context "check for data type and value" do
    before (:each) do
       @author=Author.new("Tadesse", "Alemayehu")
      @game=Game.new(nil, @author, nil, "2000-12-05",
                 2, "2015-12-05", false)
    end
    it "assert author is instance of Author" do
      expect(@game.author).to be_an_instance_of(Author)
    end
    it "assert game property have the right value" do
      expect(@game.author.first_name).to eq("Tadesse")
      expect(@game.author.last_name).to eq("Alemayehu")
      expect(@game.publish_date).to eq(Date.parse("2000-12-05"))
      expect(@game.last_played_at).to eq(Date.parse("2015-12-05"))
    end
  end
end
