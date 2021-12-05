class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    display_cards =
      @cards.select do |card|
        card if card.category == category
      end
    display_cards
  end
end
