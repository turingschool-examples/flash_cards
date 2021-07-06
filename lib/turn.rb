class Turn
  attr_reader :card, :guess
  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    if @card.answer.class == Integer
      @card.answer == @guess.to_i
    else
      @card.answer.downcase == @guess.downcase
    end
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect!"
    end
  end
end
