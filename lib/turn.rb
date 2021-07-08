class Turn
  attr_reader :card,
              :guess,
              :correct

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    card.answer == guess
  end

  def feedback
    if correct? == true
      'Correct!'
    elsif correct? == false
      'Incorrect.'
    end
  end
end
