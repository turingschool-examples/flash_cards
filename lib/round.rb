require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []

  end
  def current_card
    #current_card =
    @deck.cards[0]
    #return current_card
  end


  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    deck.cards.rotate!(1)
    @turns.last
  end
  def number_correct
    correct = 0
    #correct = 0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
    correct
  end
end
