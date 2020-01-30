class Deck
  attr_reader :cards, :category

  def initialize(cards)
    @card = cards
    @category = category
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.select do |card|
      card.category == category
    end
  end


end
