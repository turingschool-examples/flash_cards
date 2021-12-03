require './lib/card'

class Turn

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    return @string
  end

  def correct?
    if guess == answer
      puts "Congrats, You are correct!"
    else
      puts "Sorry, You are incorrect!"
    end



end
