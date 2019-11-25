require './lib/card'
require './lib/turn'

class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # def card
  #   @card
  # end

  # def guess
  #   @guess
  # end

  def correct?
    if @guess == card.answer
      true
    else
      false
    end
  end

  def feedback
    if @guess != card.answer
      puts "You are dumb."
    else
      puts "You are smart."
    end
  end

end
