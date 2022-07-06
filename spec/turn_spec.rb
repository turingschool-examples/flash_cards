require './lib/card'

class Turn :: Card

  attr_reader :string, :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  

end
