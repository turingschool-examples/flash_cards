# create a turn class

class Turn
  # initialize variables
  attr_accessor :guess,
                :card

  # initialize Turn class
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # add correct? method
  def correct?
    self.guess == self.card.answer
  end

  # add feedback method
  def feedback
    if self.correct? == true
      "Correct!"
    else
      "Incorrect."
    end

  end
end
