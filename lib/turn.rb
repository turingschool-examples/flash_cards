class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card   = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    @guess == card.answer
  end

  def feedback

    if correct? == true
      feedback = true
      puts "Correct!"
    else
      feedback = false
      puts "Incorrect."
    end
    @feedback = feedback
  end
end
