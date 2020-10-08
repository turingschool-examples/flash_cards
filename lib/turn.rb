class Turn
  attr_reader :card, :guess

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    @guess == "Juneau"
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect"
    end
  end
end
