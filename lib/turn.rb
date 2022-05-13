
class Turn
attr_reader :guess, :card, :turn
  def initialize (guess, card)

    @guess = guess
    @card = card
    @correct = []
  end

 def correct?
   @guess == card.answer
 end

 def feedback
   if correct?
     return "Correct"
   else
     return "Incorrect"
   end
 end


 end
