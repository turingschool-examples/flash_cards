class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if guess.is_a? String
      guess.downcase == @card.answer.downcase
    else
      guess == @card.answer
    end
  end

  def feedback
    return "Correct!" if correct? == true
    "Incorrect."
  end
end
