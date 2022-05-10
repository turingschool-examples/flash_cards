class Turn

  attr_reader :guess, :card

  def initialize(guess,card)
    @guess = guess
    @card = card
  end

  def correct?
    return self.guess == card.answer
  end

end
