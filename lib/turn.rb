class Turn
  attr_accessor :guess, :card

    def initialize(guess, card)
      @guess = guess
      @card = card
    end

    def guess
      return guess
    end

    def card
      return card
    end

    def correct?
      if guess == "Juneau"
        true
      else false
      end
    end

    def feedback
      if guess == "Juneau"
        return "Correct!"
      else
        return "Incorrect."
      end
    end
end
