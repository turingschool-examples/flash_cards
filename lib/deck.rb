class Deck

  attr_accessor :cards, :category_array

  def initialize(cards)
    @cards = cards
  end
  def count
    @cards.size
  end
  def cards_in_category(category)
  @category_array = []
  @category_array =  @cards.find_all do |card|
       card.category == category
    end
  end
end
