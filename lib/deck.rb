class Deck 
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def cards_in_category(category)
    @cards.find_all do |card| 
      category == card.category 
    end
  end

end