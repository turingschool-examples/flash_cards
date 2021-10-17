class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = Array.new
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, @deck.cards[0])
    @turns << turn
    @deck.cards.shift
    return turn
  end
end
