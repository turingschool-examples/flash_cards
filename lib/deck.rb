require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards_parameter)
    @cards = cards_parameter
  end

  def count
    cards.count
  end

  geography_cards = []
  stem_cards = []
  pop_culture_cards = []

  def cards_in_category(category_name)
    cards.each do |card|
      if card.category = ":STEM"
        stem_cards << card
      elsif card.category = ":Geography"
        geography_cards << card
      elsif card.category = "Pop Culture"
        pop_culture_cards << card
      end
    end
  end
end
