class Deck
  attr_reader :cards
  def initialize(card_1, card_2, card_3)
    @cards = [card_1, card_2, card_3]
  end

  def count
    cards.count
  end
end
