# creates a Deck class
class Deck
  # attribute reader and attributes
  attr_reader :cards, :count

  # define initialization method
  def initialize(cards)
    # attributes
    @cards = cards
    @count = @cards.count
    # @cards_in_category
  end

  # define cards_in_category method to check how many cards are in each category
  def cards_in_category(category_string)
    # loop through array and return the cards that match the input category
    @cards.select do |card|
        # pluck out the cards that have matching categories to the category_string
        card.category == category_string
    end
  end

end
