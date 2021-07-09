require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Maine?", "Augusta", :Geography)
card_2 = Card.new("What is the Game of Games?", "Chardee MacDennis", :TV)
card_3 = Card.new("Who won the Stanley Cup in 1996 during their inaugural season?", "Colorado Avalanche", :Sports)
card_4 = Card.new("Who said, You miss 100 percent of the shots you don't take - Wayne Gretzky", "Michael Scott", :TV)
card_5 = Card.new("Which baseball player has the most career hits?", "Pete Rose", :Sports)

cards = [card_1, card_2, card_3, card_4, card_5]

@deck = Deck.new(cards)
puts "Welcome! You're playing with #{@deck.count} cards."
@round = Round.new(@deck)


puts "---------------------------------------"
puts " "
puts "This is card number #{(@round.used_cards.size) + 1} out of #{@deck.count}."
puts "Question: #{@round.current_card.question}"
puts "What's your guess?"
puts " "
puts "---------------------------------------"

@round.take_turn(gets.chomp.downcase)

puts "You guessed, #{@round.turns.first.guess}"
puts "#{@round.turns.first.feedback}"
# This is card 2 out of 5.
puts " "
puts "---------------------------------------"
puts " "
puts "This is card number #{(@round.used_cards.size) + 1} out of #{cards.count}."
puts "Question: #{@round.current_card.question}"
puts "What's your guess?"
puts " "
puts "---------------------------------------"
puts " "

@round.take_turn(gets.chomp.downcase)

puts "You guessed, #{@round.turns.first.guess}"
puts "#{@round.turns.first.feedback}"
puts " "
puts "---------------------------------------"
puts " "
puts "This is card number #{(@round.used_cards.size) + 1} out of #{cards.count}."
puts "Question: #{@round.current_card.question}"
puts "What's your guess?"
puts " "
puts "---------------------------------------"
puts " "

@round.take_turn(gets.chomp.downcase)

puts "You guessed, #{@round.turns.first.guess}"
puts "#{@round.turns.first.feedback}"
puts " "
puts "---------------------------------------"
puts " "
puts "This is card number #{(@round.used_cards.size) + 1} out of #{cards.count}."
puts "Question: #{@round.current_card.question}"
puts "What's your guess?"
puts " "
puts "---------------------------------------"
puts " "

@round.take_turn(gets.chomp.downcase)

puts "You guessed, #{@round.turns.first.guess}"
puts "#{@round.turns.first.feedback}"
puts " "
puts "---------------------------------------"
puts " "
puts "This is card number #{(@round.used_cards.size) + 1} out of #{cards.count}."
puts "Question: #{@round.current_card.question}"
puts "What's your guess?"
puts " "
puts "---------------------------------------"
puts " "


@round.take_turn(gets.chomp.downcase)

puts "You guessed, #{@round.turns.first.guess}"
puts "#{@round.turns.first.feedback}"
puts "******* Game Over! *******"


puts "You had #{@round.turns.correct} correct guesses out of 5 for a total score of 60%."
# puts "Geography - 100% correct"
# puts "TV - 50% correct"
# puts "Sports - 100% correct"