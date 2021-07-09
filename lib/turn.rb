class Turn
  attr_reader :card, :guess
  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    @card.answer.downcase == @guess.downcase
  end

  def feedback
   correct? ? "Correct!" : "Incorrect!"
  end
end
