class Turns
  attr_reader :guess, :card, :answer
  def initialize(guess, card)
    @guess = guess
    @card = card
    @answer = answer
  end

  def correct?
    @guess == @answer
    #"Juneau"
    true
  end

  def feedback
    if @guess == @answer
      #"Juneau"
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
