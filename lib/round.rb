class Round
  attr_reader :deck, :curr_card, :turns
  def initialize(deck)
    @deck = deck
    @curr_card = 0
    @turns = []
  end

  def current_card
    @deck.cards[@curr_card]
  end

  def take_turn(guess)
    turn = Turn.new(guess, self.current_card)
    @turns << turn
    return turn
  end
end
