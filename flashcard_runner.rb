require './lib/round'
require './lib/card'
require './lib/turn'
require './lib/deck'

def start
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1,card_2,card_3])
    round = Round.new(deck)

    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"

    (1..deck.count).each do |round_num|
        puts "This is card #{round_num} out of #{deck.count}"
        puts "Question: #{round.current_card.question}"
        turn_result = round.take_turn(gets.chomp)
        puts turn_result.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{round.number_correct} out of #{deck.count} for a total score of #{round.percent_correct}"
    round.deck.categories.each do |category|
        puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
    end
end

start