require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    guess.downcase == card.answer.downcase
  end

  def feedback
    if correct? == true
      return 'Correct!'
      puts 'Correct!'
    else
      return 'Incorrect.'
      puts 'Incorrect.'
    end
  end
end
