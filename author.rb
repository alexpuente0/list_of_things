class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = rand(0..100_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include? item
    item.author = self
  end
end
