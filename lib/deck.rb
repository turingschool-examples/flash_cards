class Deck
    attr_reader :guess, :card
    def initialize (cards)
  @card = cards
  @count = cards.length
end

def cards_category(category)
  category_collection = []
  @cards.each do |card|
    if card.category == category
      category_collection << card
    end
  end

end

def count
    card.length
end

end
