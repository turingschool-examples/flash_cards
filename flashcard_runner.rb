require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
@card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
@card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
@cards = [@card_1, @card_2, @card_3]

@deck = Deck.new(@cards)
@round = Round.new(@deck)

until @round.turn_count == 0
puts "Welcome! You're playing with #{@deck.count} cards. This is card number #{@round.turn_count} out of #{@deck.cards.count}."

puts "Question: #{@round.current_card.question}"
user_guess = gets.chomp

@round.take_turn(user_guess)

puts "#{@round.turns.last.feedback}"
end

puts " ****** Game over! ****** You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct}%.

Category1 - #{@round.percent_correct_by_category(:STEM).round(0)}% correct
Category2 - #{@round.percent_correct_by_category(:Geography).round(0)}% correct"
