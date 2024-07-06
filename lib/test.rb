require './lib/turn'
require './lib/card'
require './lib/deck'


card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau?", card) 
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([@card_1, @card_2, @card_3])


var1 = "cup"
var2 = 4
var3 = []
var4 = :test
var5 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
var6 = Turn.new("Juneau?", card) 
var7 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
var8 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
var9 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
var10 = Deck.new([@card_1, @card_2, @card_3])
var11 = deck.cards

puts var1.size.class
puts var2.class
puts var3.class
puts var4.class
puts var5.class
puts var6.card.question
puts var10.class
puts var11.class