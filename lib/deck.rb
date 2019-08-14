class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(category)
    array = []

    @cards.each do |card|
      if card.category == category
        array <<  card
      end
    end
    return array
  end

  def count
    @cards.count
  end
end
