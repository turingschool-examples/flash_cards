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
  attr_reader :guess, :current_card

  def initialize(string, card)
    @guess = string
    @current_card = card
    @answer = current_card.answer
  end

  def guess
    return guess
  end

  def card
    return current_card
  end

  def correct?
    if
      @guess == @answer
      return true
    elsif @guess != @answer
      return false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    elsif correct? == false
      "Incorrect"
    end
  end

end
