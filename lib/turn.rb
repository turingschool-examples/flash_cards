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
      return true
    else
      return false
    end

     

end
