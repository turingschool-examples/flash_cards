require './lib/card'
class Deck
  attr_accessor :cards, :cards_in_category

  def initialize(cards)
    @cards = cards
    @cards_in_category = []
  end

  def count
    return cards.length
  end

  def cards_with_category(category)
    i = 0
    while i < cards.count
      if @cards[i].category == category
           @cards_in_category << @cards[i]
      end
      i += 1
    end
    return @cards_in_category
    #unsuccessful! Ask why 
    # require 'pry'; binding.pry
    # @cards.each_with_index do |card, index|
    #   if @cards[index].category == @category
    #     @cards_in_category << @card[index]
    #   end
    # end
    # return @cards_in_category

  end
end
