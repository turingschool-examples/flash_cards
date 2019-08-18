class Deck
 attr_accessor :cards

  def initialize(cards)
   @cards = cards
  end

  def count
    count = @cards.count
  end

  def cards_in_category(category_input)
    cards.select {|card| card.category == category_input}
  end
end
