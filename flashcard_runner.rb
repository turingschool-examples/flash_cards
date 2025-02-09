require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

puts "Welcome to the flashcards game!"

card_1 = Card.new("what is 5 + 5", 10, :STEM)
card_2 = Card.new("what is Rachel's favorite animal?", "panda", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Pop_Culture)
card_2 = Card.new("what cardboard cutout lives at Turing?", "Justin Bieber", :Turing_Staff)
