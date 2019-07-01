require './lib/card'

class Turn

    attr_reader :guess, :card
    def initialize(guess, card)
      @guess = guess
      @card = card
    end

  def correct?
    @guess.downcase == @card.answer.downcase
    #require "pry"; binding.pry
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end#end class
