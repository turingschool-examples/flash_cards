require 'pry'
class Round
  attr_reader :turns, :class
  attr_accessor :deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_correct_by_category = 0
  end

  def current_card
   @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
     deck.cards.rotate!
     turn
  end

  def number_correct
    @number_correct += 1
  end

  def number_correct_by_category(category)
    @number_correct_by_category << number_correct
  end

end
