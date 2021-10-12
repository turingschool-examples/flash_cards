class Turn
  attr_accessor :guess, :card

  def initialize (guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == card.answer
      true
    else
      false
    end
  end 

end
