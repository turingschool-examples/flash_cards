class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category
    cards.each do |card|
      if card.include?(:STEM)
        return cards
      end
    end
  end
end
