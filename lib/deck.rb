class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    # matching_cards = []
    # @cards.each do |card|
    #   if card.category == category
    #     matching_cards << card
    #   end
    # end
    # return matching_cards
    @cards.find_all do |card|
      card.category == category
    end
  end

end
