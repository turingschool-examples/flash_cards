class Deck
  attr_reader :cards, :category

  def initialize(cards)
    @card = cards
    @category = category
  end

  def count
    @cards.count
  end

  # def cards_in_category(category)
  #   category_array = []
  #   cards.each do |card|
  #
  #     if card.category == category
  #       category_array << card
  #     end
  # end

  def cards_in_category(category)
    category_array = []
    if card.category == category
      category_array << card
end
end
  end
