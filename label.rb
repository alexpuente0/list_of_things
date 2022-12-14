require 'json'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  @@labels = []

  def initialize(title, color, id = nil)
    @id = id || rand(0..100_000)
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

def self.save_labels
  json_array = []
  Label.labels.each do |lb|
    json_array << { id: lb.id, title: lb.title, color: lb.color }
  end
  label_db = File.new('label.json', 'w')
  label_db.write(JSON.generate(json_array))
  label_db.close
end

def list_all_labels
  Label.labels.each do |label|
    puts "Id: #{label.id}, Title: #{label.title}, Color: #{label.color}"
  end
end

def save_labels
  Label.save_labels
end

def load_labels
  return [] unless File.exist?('./label.json')

  file = File.open('./label.json')
  read_file = File.read(file)
  read_json = JSON.parse(read_file)

  loaded_labels = []

  read_json.each do |label|
    loaded_labels.push(Label.new(label['title'], label['color'], label['id']))
  end
end
