require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>

card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>

cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
expect(deck).to be_instance_of(Deck)
end


it 'has cards' do
deck = Deck.new(cards)
#=> #<Deck:0x00007fa160a38ed8...>

deck.cards
#=> [#<Card:0x00007fa16104e160...>, #<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]

 deck.count
#=> 3

 deck.cards_in_category(:STEM)
#=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]

 deck.cards_in_category(:Geography)
#=> [#<Card:0x00007fa16104e160...>]

 deck.cards_in_category("Pop Culture")
#=> []