require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'rspec'



card_1 = Card.new("Question: What is 5 + 5?", "10", :STEM)

card_2 = Card.new("Question: What is Rachel's favorite animal?", "dog", :Turing Staff)

card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", :Turing Staff

card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop Culture)

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)



round.start

round.game_over

# require 'pry'; binding.pry
