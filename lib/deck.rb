class Deck
  attr_reader :cards,
              :cards_in_category

  def initialize(count, cards_in_category)
    @cards = []
    @count = count
    @cards_in_category = cards_in_category
  end
end
