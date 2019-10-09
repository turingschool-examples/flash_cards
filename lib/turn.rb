class Turn
  require 'pry'
  require './lib/card'
  attr_accessor :guesses, :card
  def initialize(guesses, card)
    @guesses = guesses
    @card = card
  end

  def correct?
    if @guesses.downcase == @card.answer.downcase
       true
    else
       false
  end
  end

  def feedback
# return "Correct" if correct?

  #"Incorrect"

    if correct?
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
