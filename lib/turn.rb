class Turn
  attr_reader :card, :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == @card.answer
      true
  end
end
