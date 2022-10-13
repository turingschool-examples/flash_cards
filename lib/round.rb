require './lib/deck'

class Round
  attr_reader :deck, :turns, :correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct= []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @correct << turn
    end
    turn
  end

  def number_correct
    correct.length
  end

end
