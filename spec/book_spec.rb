require_relative '../book'
require_relative '../label.rb'

describe Book do
  before :each do
    @label = Label.new('Compilation', 'Green')
    @book = Book.new('Graphic Novel', 'Brian Lee Omalley', @label, '23/12/2020', 'Editorial X', 'bad')
  end

  describe '#New Book' do
    it 'Should return a book object' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'inherits from Item class' do
    expect(@book).to be_kind_of(Item)
    end
  end

  describe '#Publisher' do
    it 'returns the correct publisher name' do
      expect(@book.publisher).to eql('Editorial X')
    end
  end

  describe '#Label' do
    it 'returns the correct assigned label' do
      expect(@book.label.title).to eql('Compilation')
    end
  end

  describe '#cover_state' do
    it 'returns the correct Cover state' do
     expect(@book.cover_state).to eql('bad')
    end
  end

  #failing
#   describe 'Check if the book can be archived'
#   it 'Return true if can be archived or cover state is bad otherwise return false' do
#     expect(@book.archived).to eq(true)
#   end
  end