class Deck
  attr_reader :cards

  def initialize(cards_parameter)
    @cards = cards_parameter
  end

  def count
    cards.count
  end

end
