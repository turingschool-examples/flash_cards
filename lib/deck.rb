class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(current_category)
    @cards.find_all {|card| card.category == current_category}
  end


end
