
class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards.first
  end

  def take_turn(guess)
    Turn.new(@current_card, guess)
  end




end
