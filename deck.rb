require './lib/card'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = [card_1, card_2, card_3]
  end
end
