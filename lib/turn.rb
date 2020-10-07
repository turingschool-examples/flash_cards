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
    binding.pry
    if @correct == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end
