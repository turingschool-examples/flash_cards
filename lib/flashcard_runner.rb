require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

card_1 = Card.new("What is the capital of Arizona?", "Phoenix", :Geography)
card_2 = Card.new("Where is Big Ben located?", "London", :Geography)
card_3 = Card.new("What is 5 x 5?", "25", :STEM)
card_4 = Card.new("What is the symbol for Gold on the periodic table?", "AU", :STEM)
card_5 = Card.new("What is Fear?", "The Mind Killer", :MovieQuotes)
card_6 = Card.new("I am Paul Muad'dib Atreides", "Duke of Arrakis", :MovieQuotes)

deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])

round = Round.new(deck)

counter = 0

puts "Welcome! You're playing with #{deck.cards.length} cards."

loop do 
    counter += 1
    puts "This is card number #{counter} out of #{deck.cards.length}"
    puts "#{round.current_card.question}"
    guess = gets.chomp
    round.take_turn(guess)
    puts round.turns.last.feedback
    if counter == deck.cards.length
        break
    end
end

puts "****** Game Over! ******"
puts "You had #{round.number_correct} correct answers out of #{deck.cards.length} cards for a total score of #{round.percent_correct}%."
puts "Geography - #{round.percent_correct_by_category(:Geography)}"
puts "STEM - #{round.percent_correct_by_category(:STEM)}"
puts "Movie Quotes - #{round.percent_correct_by_category(:MovieQuotes)}"
