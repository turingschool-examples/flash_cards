class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    @turns << current_card
    @deck.cards.delete_at(0)
  end

  def current_card
    @deck.cards.first
  end
end
