class Deck
  attr_reader :cards, :count

def initialize(cards)
  @cards = cards
  @count = cards.count
end

def cards_in_category(category)
  category = cards.select do |category|
    category == matching_cards
end
end
