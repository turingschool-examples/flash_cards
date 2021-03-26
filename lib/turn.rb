class Turn
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer

    # OTHER WAYS TO WRITE
    # return true if @guess == card.answer
    # false

    # @guess == card.answer ? true : false

  end

  def feedback
    return "Correct!" if correct?
      "Incorrect."
  end

end
