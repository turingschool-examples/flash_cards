class Turn
  attr_reader :card, :guess

  def initialize(card, guess)
    @card = card
    @guess = guess
  end

  def correct?
    if guess.instance_of?(card.answer.class)
      if guess.instance_of?(String)
        # require 'pry'; binding.pry
        @guess.downcase.strip.split(".")[0] == card.answer.downcase
      else
        guess == card.answer
      end
    elsif card.answer.instance_of?(Integer) && guess.instance_of?(Float)
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
