class Deck

  attr_accessor :cards

  def initialize(cards_array)
    @cards = cards_array
  end

  def cards
    @cards
  end

  def count
    @cards.count
  end

end
