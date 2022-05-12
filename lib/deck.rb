class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    @cards.select do |card|
      category == card.category
    end
    # test = []
    # @cards.each do |card|
    #   if category == card.category
    #     test << card
    #   end
    # end
    #   return test
  end

end
