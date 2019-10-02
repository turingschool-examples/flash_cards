# deck.rb

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

end

require 'pry'; binding.pry
