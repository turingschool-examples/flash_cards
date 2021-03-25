class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @card.answer == @guess
  end

  def feedback
    if self.correct? #.self here is not necessary, but helps with readability
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
