
class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
    cards_cat = []
    @cards.each do |card|
      if cat == card.category
        cards_cat << card
      end
    end
    return cards_cat
  end

end
