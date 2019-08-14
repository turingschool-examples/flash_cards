# Class for creating a deck of cards
class Deck
  attr_reader :cards

  # Initialize the deck based on an array named cards which will be passed in
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
    cards.select {|card| card.category == cat}
  end
end
