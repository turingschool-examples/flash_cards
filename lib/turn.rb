
class Turn

  attr_accessor :card, :string
  def initialize(string, card)
    @string = string
    @card = card
    @guess = string
  end

  def guess
    require "pry"; binding.pry
    @string
  end

  def card
    @card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct?
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end
