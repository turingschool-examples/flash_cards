
  require './lib/turn'
  require './lib/card'
  require './lib/deck'
  require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?","red panda",:"Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :"Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin bieber" , "PopCulture")
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)




p "Welcome! You're playing with #{deck.count} cards."

round.start

p "Game over Bozo!!"
p "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%"
