require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :turns, :correct, :incorrect
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct= []
    @incorrect = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @correct << turn
    else
      @incorrect << turn
    end
    deck.cards.rotate!
    turn
  end

  def number_correct
    correct.length
  end

end
