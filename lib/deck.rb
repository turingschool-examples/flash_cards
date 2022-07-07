class Deck
  attr_accessor :cards, :categorized_cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @count = cards.count
  end

  def cards_in_category(category)
    @categorized_cards = []
    @cards.each do |card|
      if card.category == category
        @categorized_cards << card
      end
    end
  end
end

