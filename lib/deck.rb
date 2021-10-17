class Deck

  attr_reader :cards

  def initialize(cards_array)
    @cards = cards_array
  end

  def cards
    @cards
  end

  def count
    @cards.length
  end

  def get_all_categories
    all_categories = []
    @cards.each do |card|
      all_categories << card.category
    end
    all_categories.uniq
  end


  def cards_in_category(category_search)
    filtered = []
    cards.each do |card|
      if card.category == category_search
        filtered << card

      elsif card.category != category_search
        next
      end
    end
    return filtered
  end
end
