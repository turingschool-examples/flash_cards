#~/turn.rb
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if @guess == card.answer
      p "Correct!"
    elsif @guess != card.answer
      p "Incorrect."
    else
      p "Invalid entry"
    end
  end
  
end
