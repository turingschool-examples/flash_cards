
class Turn

  attr_reader :cards, :guess

  def initialize (guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    guess == @card.answer
  end

  def feedback
    if guess == @card.answer
      puts "Correct!"
    else
      puts "Incorrect!"
    end
  end
end
