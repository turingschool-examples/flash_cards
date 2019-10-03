class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    category_ary = []
    @cards.each do |card|
      if card.category == category
        category_ary << card
      end
    end
    category_ary
  end
end
