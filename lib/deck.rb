
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.select { |card| card.category == category}     # iterates through @cards and for each card checks if card.category matches category input and, if it does, puts in a new array
    # @cards.find_all do |card|
    #   card == category
    # end
  end

end
