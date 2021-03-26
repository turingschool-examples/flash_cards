class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

    def count
      @cards.length
    end

  def cards_in_category(category)
    @cards.find_all do |card|
      card.category == category
# because we want the card.category to match the category we've chosen
    end
  end

end
