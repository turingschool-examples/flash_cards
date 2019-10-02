require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'


class Turn
  attr_reader  :card
  attr_accessor :guess

  def initialize(guess, card)
    @guess = guess
    @card = card

  end


  def correct?
    if @guess == @card.answer
      true
    else
      false
    end
  end

  def feedback
    if self.correct? == true
      "Correct!"
    else
      "Sorry, that is incorrect."
    end
  end

end
