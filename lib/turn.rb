def Turn
  def initialize(guess, card)
    @guess  = guess
    @card   = Card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    @guess == Card(:answer)
  end

end
