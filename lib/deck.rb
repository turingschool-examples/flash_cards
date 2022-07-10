class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  # def cards_in_category(category)
  #   card_category = []
  #   @cards.each do |card|
  #     card_category << card if card.category == category
  #   end
  #   card_category
  # end

  def cards_in_category(category)
    @cards.select do |card|
      card.category == category
    end
  end
end
