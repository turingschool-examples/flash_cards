class Turn
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == card.answer
      true
    else
      false
    end

    # OTHER WAYS TO WRITE
    # return true if @guess == card.answer
    # false

    # @guess == card.answer
    # @guess == card.answer ? true : false

  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
