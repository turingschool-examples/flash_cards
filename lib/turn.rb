require './lib/card'

class Turn
  attr_reader :string, :card, :guess
  def initialize(string, card)
    @card = card
    @guess = string
  end


  def correct?
    @guess.downcase == @card.answer.downcase
  end

  def feedback
    if correct?
      "Correct!"
      else
        "Incorrect."
    end
  end
end
