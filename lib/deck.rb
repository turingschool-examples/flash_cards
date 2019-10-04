class Deck

  attr_reader :cards_array

  def initialize(cards_array)
    @cards_array = cards_array
  end

  def count
    @cards_array.length
  end

  def cards_in_category
    
  end

end


# class Deck
#
#   attr_reader :cards
#
#   def initialize(cards)
#     @cards = cards
#   end
#
#   def count
#     @cards.length
#   end
#
#   def cards_in_category(category)
#       collected_cards = []
#
#       @cards.each do |card|
#         if category == card.category
#           collected_cards << card
#         end
#       end
#       collected_cards
#   end
#
# end
