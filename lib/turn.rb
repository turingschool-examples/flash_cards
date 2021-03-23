class Turn
  attr_reader :guess, :card

    def initialize(guess, card)
      @guess = guess
      @card = card
    end

    def correct?
      if @guess == "Juneau"
        true
      else false
      end
    end

    def feedback
      if @guess == "Juneau"
        return "Correct!"
      else
        return "Incorrect."
      end
    end
end
