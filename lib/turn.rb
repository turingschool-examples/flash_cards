class Turn
  attr_reader :card, :guess

  def initialize(card, guess)
    @card = card
    @guess = guess
  
  end

  def correct?
    # require 'pry'; binding.pry
    @guess.downcase.strip == card.answer.downcase
  end

  def feedback
    if correct?
      'Correct!'
    else
      'Incorrect.'
    end
  end
end