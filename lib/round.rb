
class Round

  attr_reader :deck, :turns, :current_card

  def initialize (deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards.first
  end

  def take_turn(guess)
    start_turn = Turn.new(guess, @current_card)
  end

end
