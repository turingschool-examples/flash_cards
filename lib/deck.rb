class Deck
  attr_reader :card, :cards
  def initialize(cards)
    @cards = cards
    @cards << @card
  end

  # def card_category
  #   @card.category
  # end
  def cards
    @cards = []
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    list_of_cards = []
    @cards.each do |card|
      if card.category == category
        list_of_cards << card
      end
    end
    list_of_cards
  end
end
