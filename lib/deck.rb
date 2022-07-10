class Deck
    attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    cards.select do |card|
        card.category == category
        end
    end
end



#   make a count method and "return cards in category" method
# use iterative to check each card for argument category == card.category