class Turn #redoing everything with what I learned today

  attr_reader :string, :card
  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @guess = string
  end

  def correct?
    if @guess == @answer
      true
    else
      false
    end
  end

  def feedback
    if @guess == @answer
      "Correct!"
    else
      "Incorrect."
    end
  end
end
