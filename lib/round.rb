require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
    @number_correct = 0
  end

  def take_turn(current_guess)
    current_turn = Turn.new(current_guess, current_card)
    @turns << current_turn
    add_correct_turns(current_turn)
    shift_deck
    return current_turn
  end

  def add_correct_turns(turn)
    if turn.correct?
      @number_correct += 1
    end
  end

  def shift_deck
    deck.shift
  end
end
