class Deck
  attr_reader :cards
  def initialize(cards= [])
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def show_cards_of_category(category)
    cards.select do |card|
        card.category == category
    end
  end
end
