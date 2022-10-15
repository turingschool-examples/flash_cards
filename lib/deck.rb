class Deck
  attr_reader :cards

  def initialize(array_of_card_objs)
    @cards = array_of_card_objs.to_a
  end

  def count
    @cards.length
  end

  def cards_in_category(category_query)
    cards_in_category = []
    @cards.each do |card|
      cards_in_category << card if category_query == card.category
    end
    cards_in_category
  end
end
