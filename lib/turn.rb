#Turn class will have following methods
#initialize(string, card) string argument representing
# a guess to card's question. second argument is a card object
#representing current card shown

#guess() method returns the guess
#card() method returns the Card
#correct?() method returns boolean indicating if
#guess matches answer
#feedback() method returns either correct of incorrect


class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  #def guess
  #  return @guess
  #end

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
