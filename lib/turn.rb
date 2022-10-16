class Turn
  attr_reader :card, :string

    def initialize(string, card)
      @string = string
      @card = card
    end

    def correct?
      @string == @card.answer
    end

    def feedback
    correct? ? "Correct!" : "Incorrect."
  end
end
