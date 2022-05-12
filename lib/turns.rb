class Turns
  attr_reader :guess, :card, :answer
  def initialize(guess, card)
    @guess = guess
    @card = card
    @answer = answer
  end

  def correct?
    if @guess == "Juneau"
      true
  else
    false
    end
  end

  def feedback
    if @guess == "Juneau"
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
