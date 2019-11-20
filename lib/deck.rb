require './lib/card'

class Deck
  attr_reader(:cards)

  def initialize (card)
    @cards = []
    @cards << card
  end

  
