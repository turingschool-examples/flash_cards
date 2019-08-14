class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    # iterate over the array (each, map, find, select?)
    @cards.find_all do |card|
      category == card.category
    # return elements if the input equals the category
    # if category == card.category
    #   @card
    # else
    #   []
     end
  end
end
