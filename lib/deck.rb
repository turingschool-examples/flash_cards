require './lib/card'

class Deck
  attr_accessor :cards

  def initialize(card)
    @cards = card
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    # x = 0
    # while(x <= @cards.size)
    #   if(@cards[x].category == category)
    #     @cards[x]
    #   end
    #   x += 1
    # end

    # @cards.each do |key, value|
    #   if(key.category == category)
    #     key
    #   end
    # end

    @cards.select { |key| key.category == category }
  end

end
