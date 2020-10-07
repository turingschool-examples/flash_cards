class Turn
  attr_accessor :guess
  attr_reader :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if guess == @card.answer
      true
    else
      false
    end 
  end
end
