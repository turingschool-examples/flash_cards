
class Deck
attr_reader :cards
#want to be able to pass an array of multiple cards at initialize
  def initialize(cards)
    @cards = cards
  end

  def add_card_to_deck(card)
    @cards << card
  end

  def count
    cards.count
  end

  def cards_in_category()
    cards.find_all do |categories|
      categories == cards_in_category()
    end
  end
end
