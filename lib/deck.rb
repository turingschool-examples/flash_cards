class Deck
  attr_reader :cards, :recall_cards
  def initialize(cards, recall_cards)
    @cards = cards
    @recall_cards = @cards.map {|recall_card| recall_card}
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    cards.select{|card| card.category == category}
  end
end
