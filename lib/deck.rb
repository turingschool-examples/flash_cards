class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    this_category = []
    @cards.each do |card|
      if card.category == category
        this_category << card
      end
    end
    return this_category
  end
end
