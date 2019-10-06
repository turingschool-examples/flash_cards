class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    card_cat = []
    cards.each do |card|
      if card.category == category
        card_cat << card
      end
    end
    card_cat
  end

end
