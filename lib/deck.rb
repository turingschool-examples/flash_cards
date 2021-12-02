require './lib/card'
class Deck
  attr_reader :cards, :count
  def initialize(cards)
    @cards = cards.push
    @count = @cards.length

  end
  def cards_in_category(category)
    cards_in = []
    @cards.each do|card|
      if card.category == category
        cards_in << card
      end
    end
    return cards_in
  end

end
