# turn.rb
# require './lib/card'
# require 'pry'

class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string #first argument is the user's guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end

#binding.pry
