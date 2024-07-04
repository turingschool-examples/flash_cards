class Round
  require './lib/turn'
  attr_reader :deck, :turns, :currnet_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @currnet_card = @deck.cards[@turn_counter]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess,@currnet_card)
    @turns << new_turn
    return new_turn
  end

end