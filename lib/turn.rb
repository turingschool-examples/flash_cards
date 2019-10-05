# turn.rb

class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string #first argument is the user's guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct?
      "Correct!" #true
    else
      "Incorrect." #false
    end
  end
end

#binding.pry
