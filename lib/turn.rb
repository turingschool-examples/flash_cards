class Turn
  attr_reader :card, :guess

  def initialize(string, card)
    @card = card
    @guess = string
  end

  def correct?
    @card.answer.to_s == @guess
  end

  def feedback
    if @card.answer == @guess
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end
