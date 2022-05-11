class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # def guess
  #   @guess
  # end
  #
  # def card
  #   @card
  # end
end
  # def guess
  #   if @guess == "Juneau"
  #     puts feedback
  #   else
  #     "Incorrect"
  #   end

  # def correct?
  #   if @guess == @card
  #     true
  #   else
  #     false
  #   end
  # end
  #
  # def feedback
  #   return "Correct!" if @guess = "Juneau"
  #   "Incorrect"
  # end
