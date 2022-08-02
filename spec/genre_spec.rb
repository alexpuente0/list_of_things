require_relative '../genre'

describe Genre do
  before :each do
    @genre = Genre.new('Rock')
    @item = double('item')
    allow(@item).to receive(:add_genre)
  end
  it 'should have the right name' do
    expect(@genre.name).to eq('Rock')
  end

  it 'should add a new genre' do
    expect(@genre.items).to be_empty
    @genre.add_item(@item)
    expect(@genre.items).to include(@item)
  end
end
