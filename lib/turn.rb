require './lib/card'
class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
  end

  def correct?
  end

  def feedback
  end
end
