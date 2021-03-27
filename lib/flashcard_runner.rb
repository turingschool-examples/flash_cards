require_relative 'card'
require_relative 'turn'
require_relative 'deck'
require_relative 'round'

# runner file

# create some cards
# put cards in deck
# create round
# start round using 'start'


card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "wallaby", "Pop Culture")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Beiber", :Turing)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round_1 = Round.new(deck)

puts "Welcome! You're playing with #{cards.count} cards.
--------------------------------------------------
This card number is 1 out of #{cards.count}.
Question: #{round_1.deck.cards[0].question}"
print "Enter answer: "
guess_1 = gets.chomp

# puts "#{round_1.turns.last.feedback}" <-- doesn't work

puts "This is card number 2 out of #{cards.count}.
Question: #{round_1.deck.cards[0].question}"
print "Enter answer: "
guess_2 = gets.chomp

if round_1.deck.cards[0].answer == round_1.take_turn(guess_2).guess
  puts "#{round_1.turns.last.feedback}"
end
