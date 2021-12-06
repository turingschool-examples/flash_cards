class Turn
  attr_reader :card, :guess
  def initialize(guess, card)
    @card = card
    @guess = guess

  end

  def correct?
    if card.answer == guess
      return true
    elsif card.answer != guess
      return false
    end
  end

  def feedback
    if correct? == true
      return "Correct!"
    elsif correct? == false
      return "Incorrect."
    end
  end
end
