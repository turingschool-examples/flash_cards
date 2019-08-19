
#create Deck class
class Deck
attr_reader :cards
#Initialize with an array of Card objects
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.find_all do |card|
      card.category == category
    end
  end
end
