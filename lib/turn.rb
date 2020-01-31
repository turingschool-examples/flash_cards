class Turn

  attr_reader :guess, :card
  def initialize(player_guess, input_card)
    @guess = player_guess
    @card = input_card
  end

  def correct?
    if @guess == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
