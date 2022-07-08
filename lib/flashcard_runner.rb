require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


def start
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("What is the capital of Arizona?", "Phoenix", :Geography)
    card_5 = Card.new("How much wood can a wood chuck chuck?", "Not much", :Random)
    cards = [card_1, card_2, card_3, card_4, card_5]
    deck = Deck.new(cards)
    round = Round.new(deck)

    puts "Welcome! You're playing with #{deck.count} cards."
    puts "------------------------------------------------"

    until round.number_of_rounds == deck.count do
    puts "This is card number #{round.number_of_rounds + 1} out of #{deck.count}."
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp.downcase.capitalize
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