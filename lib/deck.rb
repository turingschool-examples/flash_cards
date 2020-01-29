class Deck
  attr_accessor :cards
  def initialize(cards= [])
    @cards = cards
  end

  def add_card(card)
    @cards << card
  end

  def cards_in_category(category)
    cards.select do |card|
        card.category == category
    end
  end
end
