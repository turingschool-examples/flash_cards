require_relative 'card.rb'

class Deck

  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

end
