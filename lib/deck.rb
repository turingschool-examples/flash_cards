class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    card_category = []
    @cards.each do |card|
      if card.category == category
        card_category << card
      end
    end
    card_category
  end

end
