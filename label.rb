class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = rand(0..100_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include? item
    item.label = self
  end
end

# test01 = Label.new('generic title', 'red')

# p test01
# p test01.title
# p test01.color
# p test01.id
