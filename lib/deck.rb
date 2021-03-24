class Deck

  attr_accessor :cards, :cards_in_category
  def initialize(cards)
    @cards = cards
    @cards_in_category = cards_in_category

  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.category
  end


end
