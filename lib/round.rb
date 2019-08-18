require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    set_next_card
    register_score(new_turn)
    new_turn
  end

  def set_next_card
    @deck.cards.shift
    @current_card = @deck.cards[0]
  end

  def register_score(turn)
    if turn.correct? == true
      @number_correct += 1
    end
  end

  def number_correct_by_category

  end

end
