

class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def card
    return @card
  end

  def correct?
     @guess == card.answer
  end

  def feedback
    if correct? == true
      "Correct!"
    elsif correct? == false
      "Incorrect"
    end
  end

end
