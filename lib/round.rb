class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[@turns.length]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @current_card)


  end

end
