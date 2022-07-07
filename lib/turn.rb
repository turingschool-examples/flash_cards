class Turn
    attr_reader :card, :guess

    def initialize(guess, card)
        @card = card
        @guess = guess
    end

    def correct?
      return true if @guess == @card.answer
      false
    end

    def feedback
        return "Correct!" if correct? == true
        "Incorrect."
    end
end
