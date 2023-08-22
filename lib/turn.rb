class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess     = guess
    @card      = card

  end

  def correct?
    card.answer == guess
    require 'pry'; binding.pry
  end

  def feedback
   if correct? == true 
    "Correct!"
   else
    "Incorrect."
   end
  end

end


