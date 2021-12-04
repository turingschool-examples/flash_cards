
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end


  def cards_in_category(category)
    included_cards = cards.map do |card|
      card if card.category == category
    end
    included_cards.compact

  end
end
