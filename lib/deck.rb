
class Deck

  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    cards_returned = []
    cards.each do |card|
      if card.category == category
        cards_returned << card
      end
    end
    return cards_returned
  end
end
