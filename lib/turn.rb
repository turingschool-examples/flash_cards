
class Turn

  def initialize (answer, card)
    @answer = answer
    @card = card
    @guess = guess
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    guess == answer
  end

  def feedback
    if quess == answer
      puts "Correct!"
    else
      puts "Incorrect!"
    end
  end
end
