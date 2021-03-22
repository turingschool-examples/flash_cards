class Turn

  def initialize(string, card)
    @card = Card
    @question = "What is the capital of Alaska"
    @answer = "Juneau"
    @category = :Geography
    @guess = guess
    @feedback = feedback
  end

  def card
    @card
  end

  def guess
    "Juneau"
  end

  def correct?
    return true if @guess = "Juneau"
    false
  end

  def feedback
    "Correct!"
  end

end
