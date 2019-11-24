class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards
    @cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
     @cards.find_all do |cat|
     category == cat.category
     end
  end

end
