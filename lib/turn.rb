class Turn
  require 'pry'
  require './lib/card'
  attr_accessor :guesses, :card
  def initialize(guesses, card)
    @guesses = guesses
    @card = card
    @correct
  end

  def correct?
    if @guesses == @card.answer
      return true
    else
    return false
  end
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
