class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct? #answer?
    @guess == @card.answer
  end

  def feedback
    if correct?
        p "Correct!"
    else
        p "Incorrect."
    end
  end
end
