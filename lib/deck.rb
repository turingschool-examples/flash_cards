class Deck
  attr_reader :cards, :count

def initialize(cards)
  @cards = cards
  @count = cards.count
end

def cards_in_category(category)
  category = cards.select do |category|
    category == matching_cards
  binding.pry
end
end


# pry(main)> deck.cards_in_category(:STEM)
# #=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
#
# pry(main)> deck.cards_in_category(:Geography)
# #=> [#<Card:0x00007fa16104e160...>]
#
# pry(main)> deck.cards_in_category("Pop Culture")
# #=> []
