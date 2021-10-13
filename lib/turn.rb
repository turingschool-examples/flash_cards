# create a turn class

class Turn
  # initialize variables
  attr_accessor :guess,
                :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    self.guess == self.card.answer
  end

  def feedback
    if self.correct? == true
      "Correct!"
    else
      "Incorrect."
    end

  end
end
