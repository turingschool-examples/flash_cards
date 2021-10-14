class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(sort)
    sorted_cards = []
    @cards.each do |card|
      if card.category == sort
        sorted_cards << card
      end
    end
    sorted_cards
  end
end
