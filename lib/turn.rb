# turn.rb
# require './lib/card'

class Turn
  attr_accessor :guess, :card

  def initialize(string, card)
    @guess = string #first argument is the user's guess
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    if @guess == @card
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end
