class Deck
 attr_reader :cards, :count

  def initialize(cards)
   @cards = cards
   @count = cards.size
  end
#require 'pry'; binding.pry
  def count
    @cards.count
  end

  def cards_in_category(category)
    #require 'pry'; binding.pry
    @cards.find_all do |card|
      card.category == category
    #cards_in_category = []
    #@cards.each do |picked_card|
    #  if picked_card.category == card_category
    #    cards_in_category << picked_card
      end
  end
    #return cards_in_category
end
