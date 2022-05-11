class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == card.answer
      true
    elsif @guess != card.answer
      false
    end
  end



  def feedback
    if @guess == card.answer
      return "Correct!"
    else
      return "Incorrect."
    end
  end


end
