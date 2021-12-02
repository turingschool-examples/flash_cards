require './lib/card'
require './lib/deck'

class Deck

  attr_reader :card
  def initialize(card)
    @card = []
  end

end
