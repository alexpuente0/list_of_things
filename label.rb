class Label
  attr_accessor :title, :color
  attr_reader :id, :items
#storage for list of labels
  @@labels = []
  def initialize(title, color)
    @id = rand(0..100_000)
    @title = title
    @color = color
    @items = []
    @@labels << self
  end

  def add_item(item)
    @items.push(item) unless @items.include? item
    item.label = self
  end
# geeter for list of labels
  def self.labels
    @@labels
  end
end

# test01 = Label.new('generic title', 'red')

# p test01
# p test01.title
# p test01.color
# p test01.id

#method to display list of labels
def list_all_label
  Label.labels.each do |label|
    puts "Id: #{label.id}, Title: #{label.title}, Color: #{label.color}"
  end
end


Label.new('Death Row Records', 'red')
Label.new('I.R.S.', 'black')
Label.new('Sub Pop', 'red')
Label.new('Burger Records', 'green')
Label.new('Motown', 'black')
