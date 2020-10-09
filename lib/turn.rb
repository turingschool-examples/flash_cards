class Turn
  attr_reader :guess, :card, :feedback

  def initialize(guess, card)
    @guess = guess
    @card = card
    @feedback = nil
  end

  def correct?
    if guess == card.answer
      @feedback = "Correct!"
      true
    elsif guess != card.answer
      @feedback = "Incorrect."
      false
    end
  end
end
