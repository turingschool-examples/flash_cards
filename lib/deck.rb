class Deck
    attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

#   make a count method and "return cards in category" method
# use iterative to check each card for argument category == card.category