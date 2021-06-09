class Deck
  attr_reader :cards

  def initialize(array_of_cards)
    @cards = array_of_cards
  end

  def count
    @cards.length
  end

  def cards_in_category(requested_category)
    @cards.find_all do |card|
      card.category == requested_category
    end
  end

end
