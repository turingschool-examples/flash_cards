
class Turn

  def initialize (guess, card)
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

#2019-06-26 corrected 'question == @answer' statement. Had to add @card before .answer
