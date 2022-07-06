require './lib/card'

# card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    self.guess == self.card.answer
  end

  def feedback
    self.correct? ? "Correct!" : "Incorrect."
  end

end
