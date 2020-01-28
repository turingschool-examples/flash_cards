class Turn
  attr_reader :guess, :card

  def initialize(guess = "", card = Card.new)
    @guess = guess
    @card = card
  end

  def correct?
    return @guess.downcase  == card.answer.downcase
  end

  def feedback
    return self.correct? ? "Correct!" : "Incorrect."
  end
end
