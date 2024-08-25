# lib/round.rb

require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
    @number_correct = 0
  end

  def take_turn(guess)
    turn = Turn.new(current_card, guess)
    @turns << turn
    @number_correct += 1 if turn.correct?
    @current_card = deck.cards[@turns.count]
    turn
  end

 
end