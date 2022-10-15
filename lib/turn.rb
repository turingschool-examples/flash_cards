class Turn
  attr_reader :card, :guess

  def initialize(card, guess)
    @card = card
    @guess = guess
  
  end

  def correct?
    # require 'pry'; binding.pry
    
    if guess.class == card.answer.class
      if guess.class == String
        @guess.downcase.strip == card.answer.downcase
      else
        guess == card.answer
      end
    elsif card.answer.class == Integer && guess.class == Float
      guess.to_i == card.answer
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