class CardGenerator
  attr_accessor :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end
end
