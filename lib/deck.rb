class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def cards_in_category(category)
   cards_by_category = []
   @cards.each do |card|
      if card.category == category
       cards_by_category << card
      end
    end
    cards_by_category
   end
 end
