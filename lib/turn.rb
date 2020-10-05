class Turn
  attr_reader :guess, :card
  attr_accessor :correct
  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct = correct?
  end

  def correct?
    if guess == card.answer
      true
    else
      false
    end
  end
end 
