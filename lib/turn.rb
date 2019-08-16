class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if guess == @card.answer
        return true
    elsif guess == @card.answer.downcase
        return true
    else
        return false
    end
  end

  def feedback
    if correct? == true
      return "Correct!"
    elsif correct? == false
      return "Incorrect."
    end
  end

  def guess
    @guess
  end

  def card
    @card
  end

end
