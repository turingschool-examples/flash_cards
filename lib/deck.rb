class Deck
  attr_reader :cards

  def initialize(list_of_cards)
    @cards = list_of_cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    cards_shared_category = []
    @cards.each do |card|
      if category == card.category
        cards_shared_category << card
      end
    end
    return cards_shared_category
  end
end
