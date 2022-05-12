class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  # def add_cards(card)
  #   @cards << card
  # end

  def count
    @cards.length
  end

  def cards_in_category(category)
    @cards.select do |card| 
      category == card.category
    end
  end
end
