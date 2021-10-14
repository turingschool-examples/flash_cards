require './lib/card'

class Turn

  attr_accessor :guess,
                :card


  def initialize(guess, card)
    @my_guess = guess
    @card_choice = card

  end

  def card
    @card_choice
  end

  def guess
    @my_guess
  end

  def correct?
    @my_guess == card.answer
  end

  def feedback
    if @my_guess == card.answer
      p "Correct!"
    else
      p "Incorrect."
    end
  end
end
