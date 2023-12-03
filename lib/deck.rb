class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count   
    @cards.length
  end

  def cards_in_category(category)
    found_cards = @cards.find_all {|card| card.category == category}
      found_cards
  end
end