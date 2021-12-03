class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct = true
  end

  def correct?
    @correct
  end

  def feedback
    "Correct!"
  end
end
