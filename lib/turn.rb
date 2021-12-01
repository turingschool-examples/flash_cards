require 'pry'
class Turn
  def initialize(string, card)
    @string = string
    @card   = card
  end

  def guess
    @answer
  end

  def card
    @card
  end

  def correct?
    if guess == card
    end
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
