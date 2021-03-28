require './card'
require './deck'
require './turn'
require './round'

card_1 = Card.new("What is Aang's name in the Fire Nation?", "Kuzon", :Pop_Culture)
card_2 = Card.new("Izuku Midoriya's hero name is?", "Deku", :Pop_Culture)
card_3 = Card.new("The Colorado Avalanche have won how many Stanley Cups(requires number spelled out)?", "Two", :Sports)
card_4 = Card.new("In cooking; a julienne is a type of what?", "Cut", :Cooking)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.cards.count} cards
-------------------------------------------------"

while round.cards_remaining?
puts "This is card number #{round.turns.count + 1} out of #{round.deck.cards.count}
Question: #{cards[0].question}\n"
round.take_turn(gets.capitalize.chomp)
puts "#{round.turns[-1].feedback}\n"
end

puts "******** Game over! *******\n
You had #{round.number_correct} out of #{deck.cards.count} for a total score of #{round.percent_correct}\n
#{deck.cards[0].category} - #{round.percent_correct_by_category(deck.cards[0].category)}\n
#{deck.cards[2].category} - #{round.percent_correct_by_category(deck.cards[2].category)}\n
#{deck.cards[3].category} - #{round.percent_correct_by_category(deck.cards[3].category)}"
