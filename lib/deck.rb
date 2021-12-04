class Deck
  attr_reader :cards, :used_cards

  def initialize(cards)
    @cards = cards
    @used_cards = []
  end

  def count
    @cards.count
  end

  def cards_in_category(card_category)
    cards_in_category_list = []
    @cards.each do |card|
      cards_in_category_list << card if card.category == (card_category)
    end
    return cards_in_category_list
  end

  def rotate
    @used_cards << @cards.shift
  end

  def shuffle
    @cards.shuffle
  end
end
