class Turn
  require 'pry'
  require './lib/card'
  attr_accessor :string, :cards, :correct
  def initialize(string, cards)
    @string = string
    @cards = cards
    @correct
  end
  def guess
    string
  end
  def card
    cards
  end
  def correct?
   if self.card.answer == self.string
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
