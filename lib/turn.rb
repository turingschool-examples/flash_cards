class Turn
    attr_reader :card, :guess

    def initialize(guess, card)
        @card = card
        @guess = guess
    end

    def correct?
      return true if @guess = @card.answer
    end

    def feedback
        return "Correct!" if correct? == true
    end
end
