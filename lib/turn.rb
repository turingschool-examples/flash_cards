class Turn
  attr_reader :card,
              :guess
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    return true if self.guess == card.answer
  end
end
