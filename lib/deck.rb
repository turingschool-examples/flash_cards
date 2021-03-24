class Deck
  attr_accessor :cards
  attr_reader :card

  def initialize(cards)
  @cards = cards

  end

  def count
   cards.length
  end
  # This doesn't work
  # def cards_in_category(category)
  #   @cards.select { |card| card.category }
  # end


end



#
