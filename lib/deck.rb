class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    list_of_cards = []
    @cards.each do |card|
      if card.category == category
      list_of_cards << card
      end
    end
  list_of_cards
  end

end
