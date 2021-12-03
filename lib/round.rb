require 'pry'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @turns.last
    # @number_correct += 1 if round.turn.correct? == true

  end

end
