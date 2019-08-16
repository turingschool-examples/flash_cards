class Deck
 attr_reader :cards

  def initialize(cards)
   @cards = []
  end

  def add_card_too_deck(card)
    @cards << card
  end
end
