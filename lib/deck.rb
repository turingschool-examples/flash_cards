class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    cards_cat = []
    @cards.each do |card|
      if card.category == category
        cards_cat << card
      end
    end
    cards_cat
  end

end
