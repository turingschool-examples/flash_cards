class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.downcase == card.answer.downcase
  end

  def feedback
    if @guess.downcase == card.answer.downcase
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end

# require "pry"; binding.pry
