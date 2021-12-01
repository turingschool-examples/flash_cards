class Turn
  def initialize(guess, card)
    @guess  = guess
    @card   = card
  end

  def guess
    @guess
  end

  def card
    Card
  end

  # def correct?
  #   if @guess == card.answer
  #     return true
  #   end
  # end
end
