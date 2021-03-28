class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess.downcase == card.answer.downcase
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    else correct? == false
      "Incorrect."
    end
  end

  def category
    card.category
  end
end
