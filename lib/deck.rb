class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def count
    ticker = 0
    @cards.each do |card|
      ticker += 1
    end
    ticker
  end

  def cards_in_category(category)
    cards_in_category = []
    @cards.each do |card|
      if card.category == category
        cards_in_category << card
      end
    cards_in_category
    end
  end
end
