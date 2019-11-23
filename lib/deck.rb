require_relative '../lib/card'

class Deck
  attr_reader :cards

  cards_in_category(:STEM) = []

  def initialize(cards)
    @cards = cards
  end

  def cards
    cards = @cards
  end

  def count
    @cards.count
  end

  def cards_in_category
     cards.find_all do |stem_cat|
       stem_cat == @category.include?(":STEM")
       cards_in_category(:STEM) << stem_cat
     end
  end
 p cards_in_category(:STEM)


end
