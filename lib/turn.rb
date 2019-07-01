require './lib/card'

class Turn

    attr_reader :guess, :card
    def initialize(guess, card)
      @guess = guess
      @card = card
    end

  def correct?
    @guess == @card.answer
    #require "pry"; binding.pry
 end

  def feedback
    if @guess == @card.answer
      "Correct!"
    else
      "Incorrect."

    end

  end

end#end class
