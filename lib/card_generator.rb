class CardGenerator
  attr_reader :filename, :cards, :file
  def initialize(filename)
    @filename = filename
    @cards = []
    @file = File.new(filename, "r")
  end

end
