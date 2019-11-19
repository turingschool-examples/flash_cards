class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards = []
  end

  def cards
    @cards << Card.new()
  end

  def count

  end

  def cards_in_category

  end
end
