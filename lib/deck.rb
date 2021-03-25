class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    return @cards.length
  end

  def cards_in_category(category)
    # I think this is a stupid way to do this so try to come back to this
    cat_array = []
    @cards.each do |card|
      require './lib/card'
      cat_array << card.category
    end
    cat_array.delete_if{|cat| cat != category}
    cat_array.length
  end

end
