class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
  cards_in_category_array = []
    @cards.each do |card|
      # require 'pry'; binding.pry
      if card.category == (category)
        cards_in_category_array << card
      end
    end
    cards_in_category_array
  end


end
