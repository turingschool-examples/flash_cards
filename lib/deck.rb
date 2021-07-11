class Deck
  attr_reader :cards, :initial_card_count

  def initialize(cards)
    @cards = cards
    @initial_card_count = cards.length
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    @cards.find_all do |card|
      card.category == category
    end
  end
end
