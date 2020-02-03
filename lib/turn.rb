class Turn
   attr_reader :guess, :card
  #
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == card.new
    true

  end

  def feedback
      return correct?() ? "Correct!" : "Incorrect."
  end
end
