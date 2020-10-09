
class Round
  attr_reader :deck, :turns, :current_card

  def initialize (deck)
    @deck = deck
    @current_card = @deck.cards[0]
    @turns = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    new_turn
  end

end
