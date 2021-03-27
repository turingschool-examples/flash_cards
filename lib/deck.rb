class Deck
  attr_reader :cards,
              :count,
              :cards_in_category

  def initialize(count, cards_in_category)
    @cards = []
    @count = count
    @cards_in_category = cards_in_category
  end

  def add_cards(card)
    @cards << card
  end

  def count_cards
    @count = cards.count #or .length?
  end

  def cards_in_category
    result = []
    cards.each do |card|
      return << card if card.last?
    end
  end
end
