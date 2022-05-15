class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    in_cat = []
    cards.each do |card|
      if card.category == category
        in_cat << card
      end
    end
    return in_cat
  end
end
