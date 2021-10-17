class Turn
  attr_accessor :turn_guess, :card_actual
  def initialize (turn_guess, card_actual)
    @turn_guess = turn_guess
    @card_actual = card_actual
  end

  def guess
    turn_guess
  end

  def card
    card_actual
  end

  def correct?
    @turn_guess == card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
