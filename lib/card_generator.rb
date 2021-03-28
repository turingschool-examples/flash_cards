class CardGenerator

  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    @cards = []
  end

end
