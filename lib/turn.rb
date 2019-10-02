class Turn
  attr_accessor :guess,
                :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # def correct?
  #   @guess == @card
  # end

  # def feedback
  #   return if true "Correct!"
  #   else
  #     "Incorrect!"
  # end


end
