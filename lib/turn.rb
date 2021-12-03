require './lib/card'

class Turn

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    return @string
  end

end
