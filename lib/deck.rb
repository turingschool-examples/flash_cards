class Deck
  attr_reader :cards
  
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    card_list = []
    # require "pry"; binding.pry
    @cards.each do |card|
      # require "pry"; binding.pry
      if card.category == category
        card_list.push(card)
      end
    end
    card_list
  end

end
