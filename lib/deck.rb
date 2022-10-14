class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end
  
  def count
    self.cards.count
  end
  
  def cards_in_category(category)
    cat = []
    @cards.each do |card|
      cat << card if card.category == category
    end
  cat
  end
end

# require "pry";binding.pry
