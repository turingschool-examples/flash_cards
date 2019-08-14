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


  # def cards_in_category
    # here we have to check each card to see if it matches the category we are passing in
  # end


end
