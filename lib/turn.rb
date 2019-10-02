class Turn
  require 'pry'
  require './lib/card'
  attr_accessor :guesses, :cards, :correct
  def initialize(guesses, cards)
    @guesses = guesses
    @cards = cards
    @correct
  end
  def guess
    guesses
  end
  def card
    cards
  end
  def correct?
   if self.card.answer == self.guesses
    self.correct = true
   else
    self.correct = false
   end
  end
  def feedback
    self.correct?
    if self.correct == true
       "Correct!"
    elsif self.correct == false
       "Incorrect!"
    end
  end
end
