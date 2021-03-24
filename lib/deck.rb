require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_catagory(catagory)
    @catagory_catch = []
    @cards.select do |card| card.catagory == catagory
      @catagory_catch.push(card)
    end
    @catagory_catch
  end
end
