require 'pry'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(categorys)
    card_category = []
    category.each do |category|
      card_category << #how do i shovel the third parameter of cards into an array???
    end
    #i think i need somthing here????
  end

binding.pry

end
