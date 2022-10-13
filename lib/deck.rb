class Deck
  attr_reader       :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
    group = []
    cards.each do |card|
      if card.category == cat
        group << card
      end
    end
    group
  end
end
