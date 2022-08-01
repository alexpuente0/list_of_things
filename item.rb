class Item
  attr_accessor :genre,:author,:source,:label,:publish_date
  def initialize(publish_date,archived: false)
    @id=rand(0..100000)
    @publish_date=Date.parse(publish_date)
  end

end
