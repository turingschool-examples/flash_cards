class Deck

  attr_reader :cards, :count, :sorted_cards

  def initialize(cards)
    @cards = cards
    @count = cards.length
    @sorted_cards = []
  end

  def cards_in_category(cat)
    @sorted_cards.clear
    cards.each do |card|
      if card.category == cat
        @sorted_cards << card
      end
    end
    return @sorted_cards
  end

  def shift
    @cards.shift
  end

end
