class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(cat)
    same_category = []
    @cards.each do |deck_card|
    same_category << deck_card if (deck_card.category == cat)
    end
    return same_category
  end

  def count
    @cards.length
  end

  def shift
    # I did this when I wasn't sure how to call .shift through deck.cards.shift...
    # It's a lil' neater so maybe it stays.
    @cards.shift
  end

end
