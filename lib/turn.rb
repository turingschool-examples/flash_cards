class Turn 
  attr_reader :guess, :card, :turn_feedback
  def initialize(guess, card)
    @guess = guess
    @card = card
    @turn_feedback = ''
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct? 
    if @guess.upcase.strip == @card.answer.upcase.strip
      feedback(true)
    else
      feedback(false)
    end
  end

  def feedback bool
    if bool
      puts "***** Correct! *****"
      @turn_feedback = "Correct!"
    else
      puts "***** Incorrect! The correct answer was #{@card.answer}. *****"
      @turn_feedback = "Incorrect!"
    end
  end
end