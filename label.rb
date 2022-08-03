class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  @@labels = []

  def initialize(title, color)
    @id = rand(0..100_000)
    @title = title
    @color = color
    @items = []
    @@labels << self
  end

    def self.labels
    @@labels
  end

  def add_item(item)
    @items.push(item) unless @items.include? item
    item.label = self
  end
end

def list_all_labels
  Label.labels.each do |label|
    print "
      title: #{label.title}
      color: #{label.color}
      "
  end
end

# test_a = Label.new('generic title', 'red')
# test_b = Label.new('title2', 'blue')

# list_all_labels

