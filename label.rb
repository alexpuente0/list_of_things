class Label
  attr_accessor :title, :color, :id

  def initialize(title, color, id)
    @id = rand(0..100_000)
    @title = title
    @color = color
    @items = []
  end

  attr_reader :items

  def add_item(item)
    @items.push(item) unless @items.include? item
    item.label = self
  end
end

test01 = Label.new('generic title','red', 9)

p test01
p test01.title
p test01.color
p test01.id