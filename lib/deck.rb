class Deck
  attr_reader :cards,
              :count,
              :categories

  def initialize(cards)
    @cards = cards
    @count = cards.length
    @categories = sort_categories
  end

  def cards_in_category(specific_category)
    @cards.select do |card|
      card.category == specific_category
    end
  end

  def sort_categories 
    sorted_categories = @cards.map do |card|
      card.category 
    end 
    sorted_categories.uniq
  end
end
