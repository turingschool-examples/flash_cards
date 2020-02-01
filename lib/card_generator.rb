class CardGenerator
attr_reader :cards
  def initialize(filename)
    @filename = File.open(filename)
    @cards = []
  end


end
