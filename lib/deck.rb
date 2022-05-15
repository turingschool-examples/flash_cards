class Deck
  attr_reader :cards 
  def initialize(cards)
    @cards = cards
    # @deck = deck
  end

  def count
  # def length
  #   require "pry"; binding.pry
    @cards.count
  # end
  # require "pry"; binding.pry
  end
  def cards_in_category(category)
    # require "pry"; binding.pry
    @cards.select do |card|
      card.category == category
  end
    # matching_cards = []
    # @cards.each do |card|
    #   # require "pry"; binding.pry
    #   if card.category == category
    #     matching_cards << card
    #
    #   end
    # end
    # return matching_cards
  end
end
