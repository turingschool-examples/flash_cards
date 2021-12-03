class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def draw
    cards.shift
  end

  def cards_in_category(named_category)
    selected_cards = []
    cards.each do |reviewed_card|
      if reviewed_card.category == named_category
      selected_cards << reviewed_card
      end
    end
    selected_cards
  end
end
