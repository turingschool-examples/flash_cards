class Round
  attr_reader :deck, :curr_card
  def initialize(deck)
    @deck = deck
    @curr_card = 0
  end

  def current_card
    @deck.cards[@curr_card]
  end

  def take_turn(guess)
    Turn.new(guess, self.current_card)
  end
end
