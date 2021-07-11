require './lib/card'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(input_category)
    @cards.find_all {|element| input_category == element.category}
  end

  def count
    @cards.length
  end

  def categories
    card_categories = []
    @cards.each do |x|
      card_categories << x.category.to_sym
    end
    card_categories.uniq
  end

end
