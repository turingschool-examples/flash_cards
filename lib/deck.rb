class Deck
  attr_reader :cards

  def initialize(cards)
    @cards    = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    cat_sort = []
    @cards.each do |card|
      if category == card.category
        cat_sort << card
      end
    end
    cat_sort
  end
end
