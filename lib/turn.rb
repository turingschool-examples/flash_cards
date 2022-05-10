class Turn

  attr_reader :guess, :card

  def initialize(guess,card)
    @guess = guess
    @card = card
  end

  def correct?
    return self.guess.downcase == card.answer.downcase
  end

end
