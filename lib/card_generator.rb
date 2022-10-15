class CardGenerator
  attr_reader :filename, :cards
  def initialize(filename)
    @filename = File.open(filename)
    @cards = []
  end
end
