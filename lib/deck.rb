class Deck
  attr_reader :cards, :count, :catogory
  def initialize(cards)
    @cards = cards
    @count = cards.count
    @catogory = catogory
  end

  def cards_in_catogory(type)
    @category = type
  end
end
