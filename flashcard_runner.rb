#initialize classes, methods and functions
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
cats = []

begin
puts "Welcome! You're playing with #{deck.count} cards.\n
 ------------------------------------------------- \n"

 until round.turns.length  == deck.count do
    
    puts "This is card number #{round.turns.length + 1} out of #{deck.count}\n
Question: #{round.current_card.question}\n"

    user_input = gets.chomp
    user_input.chomp!(" ")
    user_input.capitalize!

        round.take_turn(user_input)
            if round.turns.last.feedback == "Incorrect"
                puts "Incorrect. \n"
            else 
                puts "Correct! \n"
            end
    end
puts "****** Game over! ******\n
You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}%.\n"
deck.cards.each {|card|cats.push(card.category)}
cats.uniq!
cats.each {|cat| puts "#{cat} - #{round.percent_correct_by_category(cat)}%"}
end