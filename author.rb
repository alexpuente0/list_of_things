class Author
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item item
    @items<<item unless @items.include? item
    item.author << self
  end
end
