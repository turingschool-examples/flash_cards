class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end


  #   # Go into the array and pull the category from each entry.
  #   # We want this to return an array with the cards that are of the same category.

  def cards_in_category(category)
    category_ary = []
    @cards.each do |card|
      if card.category == category
        category_ary << card
      end
    end
    category_ary
  end

# the next block of code was practicing a simpler example of using each to check the category.
  def category_of_each_card
    card_category_ary = []
    cards.each do |cards|
     card_category_ary << cards.category
    end
    card_category_ary # Having this line was the only way I could get it to return just the categories.
  end

end
