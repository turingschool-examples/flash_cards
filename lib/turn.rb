class Turn
  attr_reader :guess, :card
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def feedback
    if @guess == @card
      "Correct!"
    else
      "Incorrect."
    end
  end

  def correct?
    if @guess == @card
      return true
    else
      return false
    end
  end
end
