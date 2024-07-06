require './lib/card'

class Round
  attr_reader :deck, :turns, :turn, :guess, :new_card, :current_card

  def initialize(deck)
  @deck = deck
  @turns = []
  @turn_counter = -1
  @guess = guess
  @new_card
  @current_card
  end

end

def new_card
  if (@deck.count -1) > @turn_counter
    @turn_counter += 1
    @current_card = @deck.cards[@turn_counter]
  end
end

def take_turn(guess)
  new_turn = Turn.new(guess, @current_card)
  @turns.push(new_turn)
  return new_turn
end
