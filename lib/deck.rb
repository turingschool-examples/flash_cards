# Richard Tillies
# October 12, 2021
# Deck class
# ~/turing/1module/projects/flash_cards/lib/deck.rb

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(cat)
    cat_deck = []
    @cards.each do |card|
      if card.category == cat
        cat_deck << card
      end
    end
    cat_deck
  end

end
