require './lib/card'


class Turn

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    return @guess
  end

end
