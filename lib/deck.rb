class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def add_card(card_added)
    @cards << card_added
  end

  def count
    @cards.length
  end

  def cards_in_category(card_category)
    cards_in_category_array = @cards.find_all do |card|
      card.category == card_category
    end
    cards_in_category_array
  end


end
