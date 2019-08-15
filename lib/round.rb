
class Round
  attr_reader :deck, :current_card, :turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    @current_card = deck.cards[0]
    turn
  end

end
