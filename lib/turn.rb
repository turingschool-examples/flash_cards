
class Turn
attr_reader :guess, :card, :correct
  def initialize (guess, card)

    @guess = guess
    @card = card
    @correct = []
  end

 def correct?
   if @answer = @guess
     true
   else
     false
   end

   def feedback?


   end

 end



  end
