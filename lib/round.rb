class Round
attr_reader :turns, :deck

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns << turn
    return turn
  end
end
