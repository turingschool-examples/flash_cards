class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    new_array = []
    @cards.each do |card|
      new_array << card if category == card.category
    end
    new_array
  end

end
