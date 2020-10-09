class Turn
  attr_reader :guess, :card
  attr_accessor :correct
  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct = correct?
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    @guess == @card.answer ? true : false
  end

  def feedback
    @correct == true ? "Correct!" :  "Incorrect."
  end
end
