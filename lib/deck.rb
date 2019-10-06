class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

#Test won't pass stating that there are 0 arguments, but expects 1 on line 13
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
