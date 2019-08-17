class Deck
  attr_reader :cards_in_deck

  def initialize(cards_param)
    @cards_in_deck = cards_param
  end

  def cards_in_category(category_param)
    @cards_in_deck.find_all do |card|
      card.category == category_param
    end
  end
end
