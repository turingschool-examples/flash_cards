
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category
    cards.select{|category| card.category == category}
  end

end
