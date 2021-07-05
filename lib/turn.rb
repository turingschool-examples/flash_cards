class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == @answer
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct"
    else
      "Incorrect"
    end
  end
end