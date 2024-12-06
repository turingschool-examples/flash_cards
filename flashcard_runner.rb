require './lib/round'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/card_generator'

def start
    cards = CardGenerator.new("cards.txt").cards
    deck = Deck.new(cards)
    round = Round.new(deck)

    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"

    deck.count.times do |round_num|
        puts "This is card #{round_num + 1} out of #{deck.count}"
        puts "Question: #{round.current_card.question}"
        turn_result = round.take_turn(gets.chomp)
        puts turn_result.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{round.number_correct} out of #{deck.count} for a total score of #{round.percent_correct}%"
    round.deck.categories.each do |category|
        puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
    end
end

start