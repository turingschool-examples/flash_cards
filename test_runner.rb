# test_runner.rb - for running sample code while building out / testing classes
#NOTE: also create handy irb session with this at the bottom!

require './lib/card'
require './lib/deck'
require './lib/turn'
#Can I just do one line of "require './lib/'?  Or is that not precise / good written habit?"


#Testing out basic card, turn, and deck functionality:
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

puts deck.cards()
puts deck.count()
puts deck.cards_in_category(:STEM)
puts deck.cards_in_category(:Geography)
puts deck.cards_in_category("Pop culture")


#Now run it in irb to make checking variables, etc. easy!
require 'irb'
binding.irb