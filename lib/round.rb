
class Round
  attr_accessor :deck, :current_card, :turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    @current_card = deck.cards[0]
    new_turn
  end

end
