require_relative '../author'

describe Author do
  context "check for data type and value" do
    before (:each) do
      @author=Author.new("Tadesse", "Alemayehu")
    end
    it "assert name are string " do
      expect(@author.first_name).to be_an_instance_of(String)
      expect(@author.last_name).to be_an_instance_of(String)
    end
    it "assert name have the right value" do
      expect(@author.first_name).to eq("Tadesse")
      expect(@author.last_name).to eq("Alemayehu")
    end
  end
end
