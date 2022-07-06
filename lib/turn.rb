class Turn
attr_reader :guess, :card, :feedback

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == card.answer
      true
      @feedback = "Correct!"
    else false
      @feedback = "Incorrect."
    end
  end

end
