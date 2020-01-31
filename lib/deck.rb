class Deck

  attr_reader :cards
  def initialize(array_of_cards_for_the_deck)
    @cards = array_of_cards_for_the_deck
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    array_of_cards_in_category = []
    @cards.each do |card|
      if card.category == category
        array_of_cards_in_category << card
      end
    end
    array_of_cards_in_category
  end
end
