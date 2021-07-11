require 'pry'
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @card.answer.downcase == @guess.downcase
  end

  def feedback
    if @guess == @card.answer.downcase
      "Correct!"
    else
      "Incorrect."
    end
    # binding.pry
  end
end
