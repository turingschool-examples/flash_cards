class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(category)
    # @cards.find_all do |card|
    #   card.category == category
    category_cards = []
    @cards.each do |card|
      if card.category == category
        category_cards << card
      end
    end
    category_cards
  end
end
