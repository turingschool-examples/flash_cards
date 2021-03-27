require './card'
require './deck'
require './turn'
require './round'

card_1 = Card.new("What is Aang's name in the Fire Nation?", "Kuzon", :popculture)
card_2 = Card.new("Izuku Midoriya's hero name is?", "Deku", :popculture)
card_3 = Card.new("bb", "dd", :L)
card_4 = Card.new("cc", "dd", :L)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.cards.count} cards\n
-------------------------------------------------"

while round.loop_break
puts "This is card number #{round.turns.count + 1} out of #{round.deck.cards.count}\n
Question: #{deck.cards[0].question}\n"
round.take_turn(gets.capitalize.chomp)
puts "#{round.turns[-1].feedback}"
end

puts "******** Game over! *******\n
You had #{round.number_correct} out of #{deck.cards.count} for a total score of #{round.percent_correct}\n
#{deck.cards[0].category} - #{round.percent_correct_by_category(deck.cards[0].category)}\n
#{deck.cards[1].category} - #{round.percent_correct_by_category(deck.cards[1].category)}\n
#{deck.cards[2].category} - #{round.percent_correct_by_category(deck.cards[2].category)}\n
#{deck.cards[3].category} - #{round.percent_correct_by_category(deck.cards[3].category)}"
#perhaps use an if so that iit remains user friendly
# so if deck.cards[1].category != deck.cards[0].category puts deck.cards[1].category
