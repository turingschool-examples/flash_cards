require './lib/card'

class Turn

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    return @string
  end

  def card
    return @card
  end

  def correct?
    if guess == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if guess == @card.answer
      puts "Congrats, You are correct!"
    else
      puts "Sorry, You are incorrect!"
    end
  end



end
