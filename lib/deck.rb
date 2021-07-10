class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.find_all {|type| type.category == category}
  end

  def first_card_category
    @cards.shift.category
  end

  def all_categories
    num_cards = count
    card_categories = []
    num_cards.times {card_categories << first_card_category} #may be able to do this differently with map
    card_categories
  end

  def categories
    all_categories.uniq
  end
end
