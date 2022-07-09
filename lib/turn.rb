class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card

  end

# Checks whether the guess matches the answer
  def correct?
     @guess == @card.answer
  end

# Prints feedback depending on whether guess was correct
  def feedback
    if @guess == @card.answer
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end
