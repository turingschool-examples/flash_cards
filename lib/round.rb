class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(current_card, guess)
    @turns << new_turn
    new_turn
  end

  def correct?
  end

end
