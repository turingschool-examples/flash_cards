class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = @cards.count
    # @cards_in_category
  end


  # def cards_in_category
    # here we have to check each card to see if it matches the category we are passing in
  # end


end
