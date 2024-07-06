class Turn

  attr_reader :guess, :card, :feedback
  
  def initialize(guess, card)
    @guess = guess
    @card = card
    
    if @guess.downcase == @card.answer.downcase
      @feedback = "Correct!"
    else
      @feedback = "Incorrect."
    end
  end

  def correct?
    if @feedback == "Correct!"
      return true
    else
      return false
    end
  end

end


