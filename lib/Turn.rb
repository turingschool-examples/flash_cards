class Turn
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    return @guess
  end

  def card
    return @card
  end

  def correct?
    @guess.to_s.downcase == card.answer.to_s.downcase
  end

  def feedback
    if correct?
      "That's correct!"
    else
      "That's incorrect."
    end
  end
end

  