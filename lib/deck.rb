class Deck
  attr_reader :cards

  def initialize(card)

    @cards = card
    
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
