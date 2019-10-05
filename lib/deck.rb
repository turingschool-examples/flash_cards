# require './lib/card'
# require './lib/turn'
require'pry'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end
# binding.pry
end
