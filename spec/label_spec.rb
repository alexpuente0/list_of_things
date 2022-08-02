require_relative '../label'
require_relative '../item'

describe Label do
  before :each do
    @label = Label.new('SciFi', 'Blue')
  end

  describe '#New Label' do
    it 'Should return a New Label object' do
      expect(@label).to be_an_instance_of(Label)
    end
  end

  describe '#Title' do
    it 'Should return the correct Label Title' do
      expect(@label.title).to eq('SciFi')
    end
  end

  describe '#Color' do
    it 'Should return the correct Label Color' do
      expect(@label.color).to eq('Blue')
    end
  end

  describe 'Add items to label'
  it 'Push a new item in Each label class object' do
    item = Item.new('08/04/2020')
    @label.add_item(item)

    expect(@label.items).to include(item)
  end
end
