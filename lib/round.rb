# require './lib/turn'

class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card()
    return deck.cards[0]
  end

  def take_turn(guess)
    this_turn = Turn.new(guess, current_card())
    @turns << this_turn
    if this_turn.guess == current_card().answer
      @number_correct += 1
    end
    # @deck.rotate(1)
    return this_turn
    #require 'pry'; binding.pry
  end
end
