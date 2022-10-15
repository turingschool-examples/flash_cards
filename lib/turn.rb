class Turn
  attr_reader :card, :guess

  def initialize(card, guess)
    @card = card
    @guess = guess
  
  end

  def correct?
    # require 'pry'; binding.pry
    if guess.class == card.answer.class
      if card.answer.class == String
        @guess.downcase.strip == card.answer.downcase
      else card.answer.class == Integer
        guess == card.answer

      end
    else
      false
    end
    
  end

  def feedback
    if correct?
      'Correct!'
    else
      'Incorrect.'
    end
  end
end