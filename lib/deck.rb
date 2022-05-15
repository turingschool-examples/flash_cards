require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end
  def cards_in_category(category)
      cards.select { |card| card.category == category }
  end

  
  # def cards_in_category(category)
  #   cards_in_category = []
  #   @cards.each do |card|
  #     if card.category == cards_in_category << card
  #     end
  #   end
  #   cards_in_category
  # end
end
