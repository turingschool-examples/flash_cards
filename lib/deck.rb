class Deck
  attr_reader :cards

  def initialize(cards)
      @cards = cards
  end

  def count
      @cards.length
  end

  def cards_in_category(category)
      cat_arr = []
      @cards.each do |card|
        if card.category == category
            cat_arr << card
        end
    end
    cat_arr
  end
end