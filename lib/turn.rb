class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if turn.guess = card.answer
      return true
    else
      return false
    end
  end


end
