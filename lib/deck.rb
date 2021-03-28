class Deck
  attr_reader :cards,
              :count,
              :cards_in_category

  def initialize(count)
    @cards = []
    @count = count
    @cards_in_category = []
  end

  def add_cards(card)
    @cards << card
  end

  def count_cards
    @count = cards.count #or .length?
  end

  def cards_in_category
    @cards_in_category = cards.map do |card|
      card.category
    end
  end
end
