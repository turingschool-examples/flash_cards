
require './lib/turn'

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card

    @deck.cards.shift
  end

  def take_turn(guess)

    turn = Turn.new(guess, current_card)
    @turns << turn
      if turn.correct? == true
        @number_correct += 1
      end
    return turn

  end

  #def take_turns(guess)
  #  turn = Turn.new(guess)

  #end

  #def correct?
  #end

end
