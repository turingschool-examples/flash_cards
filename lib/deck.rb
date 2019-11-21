require './lib/card'

class Deck
  attr_reader(:cards)

  def initialize (cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    cards_in_category = []
    # need to look into cards array, and evaluate each card for the given category
    # if card macthes the given category, then insert it into a new array
    @cards.each do |card|
      if card.category == category
        cards_in_category << card
      end
    end
    # need to produce an array with the cards corresponding to the given category
    p cards_in_category
  end

end
