class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    @guess == @card.answer
  end
end
