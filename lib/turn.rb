class Turn
  attr_accessor :guess
  attr_reader :card, :correct_guess

  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct_guess = nil
  end

  def correct?
    @correct_guess = (@guess == @card.answer)
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
