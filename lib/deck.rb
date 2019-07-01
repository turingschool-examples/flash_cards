require './lib/card'
require './lib/deck'

class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_per_category(categoree)
  @cards.select {|card| card.category == categoree}
  #   ref_cat = []
  #   @cards.each do |card|
  #     card.category == categoree
  #     ref_cat << card
  #   end #end do loop
  #     ref_cat
  # end#end method
end 
end #end class

#   attr_reader :card_1, :card_2, :card_3
#   def initialize(card_1, card_2, card_3)
#     @card_1 = card_1
#     @card_2 = card_2
#     @card_3 = card_3
#   end
# end
