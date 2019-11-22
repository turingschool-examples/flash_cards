class Turn

  attr_reader  :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card

  end

  def correct?
    if @guess == card.answer
      turn.feeback
    else

    end
  end

  def feedback
    if true
      puts "Correct!"
    else false
      puts "Incorrect!"
  end

end


# turn.card
# turn.guess
# turn.correct?
# turn.feedback
