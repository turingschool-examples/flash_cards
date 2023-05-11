require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

card_1 = Card.new("What is the capital of Massachusetts?", "Boston", :Geography)
card_2 = Card.new("Who is the telescope launched by NASA on December 25, 2021, named after?", "James Webb", :STEM)
card_3 = Card.new("What kind of cat is Clare?", "Very cute", :Pets)
card_4 = Card.new("What country is known as the sweet potato of Asia?", "Taiwan", :Geography)
    
deck = Deck.new([card_1, card_2, card_3, card_4])
    
round = Round.new(deck)

round.start