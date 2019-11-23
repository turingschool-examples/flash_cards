class Deck
  attr_reader :cards

  def initialize(array_of_cards)

    @cards = array_of_cards

  end

  def count
    @cards.count
  end

  def cards_in_category(category)

      cards_in_category = cards.select do |card|

      card.category == category

    end
      cards_in_category
  end

end
