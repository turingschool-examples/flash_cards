class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = Array.new
  end

  # or def turns
  #   Array.new
  #   # or []
  # end

  def current_card
    deck.cards.first
  end

end
