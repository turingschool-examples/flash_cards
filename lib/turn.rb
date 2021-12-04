class Turn
  attr_reader :guess, :card
  def initialize(my_guess, my_card)
    @guess  = my_guess
    @card   = my_card
  end

  # def guess
  #   @guess
  # end
  #
  # def card
  #   @card
  # end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if @guess == @card.answer
      "Correct!"
    else
      "Incorrect."
    end
  end
end
