class Turn
  attr_reader :guess, :card, :new_turn

  def initialize(guess, card, new_turn)
    @guess = guess
    @card = card
    @new_turn = new_turn
  end

  def correct?
    if card.answer == @guess
      return true
    end
  end

  def feedback
    if correct? == true
      p "Correct!"
    else
      p "Incorrect."
    end
  end

end
