require './lib/turn'
require './lib/card'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate
    @turns.last
  end

  def guess_correct
    @turns.each do |turn|
      turn.correct?
  end
end

def number_correct
 correct = []
 @turns.each do |turn|
   if turn.correct?
     correct << turn
   end
 end
 correct.count
end








end
