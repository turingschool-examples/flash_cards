require './lib/turn'
require './lib/card'


card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau?", card) 

var1 = "cup"
var2 = 4
var3 = []
var4 = :test
var5 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
var6 = Turn.new("Juneau?", card) 

puts var1.size.class
puts var2.class
puts var3.class
puts var4.class
puts var5.class
puts var6.card.question