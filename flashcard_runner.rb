require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'


card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "tarantula", :"Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :"Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :"Pop Culture")

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
# card_count = round.deck.count
# puts round.deck.count
# puts card_count
def start(round)
  this_round = round
  turn_number = 0
  current_card = round.current_card()
  turn_number = 0
  puts "Welcome! You're playing with #{this_round.deck.count} cards."
  puts "-----------------------------------------------------------"
  puts "This is card number #{turn_number + 1} out of #{this_round.deck.count}"
end

start(round)
