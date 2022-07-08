require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'


def start
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    deck = Deck.new(cards)
    round = Round.new(deck)

    puts "Welcome! You're playing with #{deck.count} cards."
    puts "------------------------------------------------"

    until round.number_of_rounds == deck.count do
    puts "This is card number #{round.number_of_rounds + 1} out of #{deck.count}."
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp.downcase
    new_turn = round.take_turn(guess)
    puts new_turn.feedback
    
    end
    
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{round.number_of_rounds} for a total score of #{(round.percent_correct).to_i}%."
    cards_processed = 0
    until cards_processed == round.card_categories.count
        puts round.total_correct_by_category.to_a[cards_processed][0].to_s + " - " + (round.percent_correct_by_category(round.total_correct_by_category.to_a[cards_processed][0])).to_i.to_s + 
         "% correct"
        cards_processed += 1
    end

    puts "-------------------------------------------------"
end

puts start