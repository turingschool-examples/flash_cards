class Deck

  attr_reader :cards

  def initialize(arr)
    @cards = arr
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    @cards.find_all do |card|
      card.category == category
    end
  end

  def current_card
    @cards.first
  end

end
