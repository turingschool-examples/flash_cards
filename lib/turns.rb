
class Turns
  attr_reader :guess, :card, :answer
  def initialize(guess, card)
    @guess = guess
    @card = card
    @answer = answer
  end

  def correct?
    if @guess == @answer
    #"Juneau"
    return true
    end
  end

  def feedback
    if @guess == @answer
      return "Correct!"
    else
      return "Incorrect!"
    end

  end

end

turns = Turns.new("Juneau", @card)
turns.correct?
turns.feedback
    # if @guess == @answer
    #   #"Juneau"
    #   "Correct!"
    # else
    #   "Incorrect!"
