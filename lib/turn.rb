class Turn
  attr_accessor :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if correct? #== true
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
# require 'pry'; binding.pry;
