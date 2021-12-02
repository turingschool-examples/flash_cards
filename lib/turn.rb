class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess  = guess
    @card   = card
  end

def correct?

  if @guess == "Juneau"
    true
  elsif
    @guess == "Mercury"
    true
  else
    false
  end
end

def feeback
  if @guess == "Juneau"
     "Correct!"
   elsif @guess == "Mercury"
      "Correct!"
    else
     "Incorrect!"
   end
 end


end
