
class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if card.answer = @guess
      true
    else
      false
    end
  end


  def feedback
    if correct? == true
       "Correct!"
     elsif
       "Incorrect."
    end
  end
end
