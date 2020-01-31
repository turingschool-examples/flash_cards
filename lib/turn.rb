class Turn

  attr_reader :guess, :card
  def initialize(player_guess, input_card)
    @guess = player_guess
    @card = input_card
  end

  def correct?
    if @guess.upcase == @card.answer.upcase
      true
    else
      false
    end
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
