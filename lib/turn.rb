class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return true if guess == card.answer
    return false if guess != card.answer
  end
end
