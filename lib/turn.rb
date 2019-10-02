
require './card'
require './deck'
require 'pry'

class Turn
  attr_accessor :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end
  def correct?
    @guess == @card.answer
  end
  def feedback
    if correct?
      p "Correct"
    else
      p "Incorrect"
    end
  end
end







card = Card.new("What is the capital of Alaska?", "Juneau", "Geography")
turn = Turn.new("Juneau", card) #This is the user input?

binding.pry
