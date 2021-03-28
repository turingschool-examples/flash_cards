class Turn
  attr_accessor :guess,
                :card,
                :correct  #:card1

  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct = true
  end

   def correct?
     @guess == "Juneau"
   end

    def feedback
      if @guess == "Juneau"
        return "Correct!"
      else
        return "Incorrect."
      end
    end

end
