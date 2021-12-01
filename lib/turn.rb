require './lib/card'


class Turn

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

end
require 'pry'; binding.pry
