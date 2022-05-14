class Turn

  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess.downcase
    @card = card
  end

  def correct?
    return true if @guess == @card.answer
    false
  end

  def feedback
    if correct? == true
      return 'Correct!'
    else
      return 'Incorrect.'
    end
  end
end
