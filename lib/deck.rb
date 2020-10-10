class Deck
attr_reader :card, :cards, :deck, :category

  def initialize(cards)
    @card = card
    @cards = cards
    @deck = deck
  end

  def count
    cards.length
  end

  def cards_in_category(category_type)
    cards.find_all do |card|
      card.category == category_type
    end

  end



end
