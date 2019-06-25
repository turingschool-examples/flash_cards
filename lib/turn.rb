class Turn
  attr_reader :guess, :card
  def initialize(g, c)
    @guess = g
    @card = c
  end

  # def card
  #   @card
  # end
  #
  # def guess
  #   @guess
  # end

  def correct?
    @guess == card.answer ? true : false
  end

  def feedback
    @guess == card.answer ? "Correct!" : "Incorrect."
  end
end
