# turn.rb
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
    @result = false
  end

  def a_guess
    @guess
  end

  def a_card
    @card
  end

  def correct?
    @result = (guess == card.answer)
    @result
  end

  def feedback
    if @result
      'Correct!'
    else
      'Incorrect.'
    end
  end
end
