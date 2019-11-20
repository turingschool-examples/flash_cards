class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    card_array = []

    # iterate through cards
    @cards.each do |card|
      # check category of card against arguement
      if card.category == category
        card_array << card
      end
      # if categories match
      # put card in new array
    end
     card_array
  end
end
