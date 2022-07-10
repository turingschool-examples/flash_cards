class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    require "pry"; binding.pry
    deck.cards[0]
  end
end
