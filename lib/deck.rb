class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    same = []
    @cards.each do |card|
      if card.category == category
        same << card
      end
    end
    same
  end
end
