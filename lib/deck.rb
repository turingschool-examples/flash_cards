#~/deck.rb
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(requested_category)
    catagorized_cards = []
    @cards.each do |card|
      if requested_category == card.category
        catagorized_cards << card
      end
    end
    catagorized_cards
  end
end
