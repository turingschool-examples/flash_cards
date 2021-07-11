class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    categorized_cards = []
    @cards.each do |card|
      if card.category == category
        categorized_cards << card
      end
    end
    categorized_cards
  end

  # def cards_in_category(category)
  # can use the enumerable find_all
  # @cards.find_all do |card|
  #  card.category == category
  # end
end
