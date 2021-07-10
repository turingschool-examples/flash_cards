class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def cards_in_category(category)
    @cards.select do |card|
      card.category == category
    end
  end

  # def cards_in_category2(category)
  #   selected_cards = []
  #   @cards.each do |card|
  #     if card.category == category
  #       selected_cards << card
  #     end
  #   end
  #   selected_cards
  # end
end
