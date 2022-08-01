class Genre
  def initialize(name)
    @id = rand(0..100_000)
    @name = name
    @items = []
  end
end
