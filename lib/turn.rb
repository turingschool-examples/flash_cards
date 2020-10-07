require './card.rb'

class Turn
  attr_reader :card
  def initialize (string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def correct?
    @string == @answer
  end

  def feedback
    if @string == @answer
      p "Correct!"
    else
      p "Incorrect!"
    end
  end

end
