class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def cards_in_category(category)
    @category = []
    @cards.each do |card|
      if card.category == category
        @category << card
      end
    end
    @category
  end
end
