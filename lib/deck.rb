class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    new_array = []
    @cards.each do |card|
      if card.category == category
        new_array << card
      end
    end
    new_array
  end

end
