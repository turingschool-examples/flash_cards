require 'pry'
class Turn
  def initialize(string, card)
    @string = string
    @card   = card
  end

  def guess
    @guess = card.answer
  end

  def card
    @card
  end

  def correct?

    @string == @guess

  end

  def feedback
    if correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

end
binding.pry
