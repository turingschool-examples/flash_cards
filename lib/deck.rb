class Deck

  def initialize(array_of_cards_for_the_deck)
    @array_of_cards = array_of_cards_for_the_deck
  end

  def cards
    return @array_of_cards
  end

  def count
    number_of_cards = @array_of_cards.size
    return number_of_cards
  end

  def cards_in_category(category)
    array_of_cards_in_category = []
    @array_of_cards.each do |card|
      if card.category == category
        array_of_cards_in_category << card
      end
    end
    return array_of_cards_in_category
  end
end
