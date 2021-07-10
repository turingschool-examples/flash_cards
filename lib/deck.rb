class Deck
  attr_reader :cards, :current_card

  cards = []

  def initialize (cards)
    @cards = cards
    @current_card = cards[0]
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    cards.find_all do |card|
      card.category == category
    end
  end
end
