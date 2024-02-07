# This is a class providing functionality for each individual
# turn in a Round. It has methods to check whether the answer
# for that turn is correct, and provides feedback based on
# whether or not the answer for that turn is correct.
#
# Syntax:
#
# turn = Turn.new("guess", card)
class Turn
  attr_reader :card, :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if @guess.downcase == @card.answer.downcase
      'Correct!'
    else
      "Incorrect. The correct answer is #{@card.answer}"
    end
  end
end
