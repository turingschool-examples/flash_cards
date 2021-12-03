class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
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
    @cards.shift
  end



end
