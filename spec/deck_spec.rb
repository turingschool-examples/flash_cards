puts require './lib/card'
#=> true

puts require './lib/deck'
#=> true

puts card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>

puts card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>

puts card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>

cards = [card_1, card_2, card_3]

puts deck = Deck.new(cards)
#=> #<Deck:0x00007fa160a38ed8...>

puts deck.cards
#=> [#<Card:0x00007fa16104e160...>, #<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]

puts deck.count
#=> 3

puts deck.cards_in_category(:STEM)
#=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]

puts deck.cards_in_category(:Geography)
#=> [#<Card:0x00007fa16104e160...>]

puts deck.cards_in_category("Pop Culture")
#=> []