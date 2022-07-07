require './lib/round'
require './lib/card_generator'

file_path = './lib/cards.txt'
card_generator = CardGenerator.new(file_path)
deck_1 = Deck.new(card_generator.cards)

round_1 = Round.new(deck_1)

def start(round)

    puts "Welcome! You're playing with #{round.deck.count} cards."
    puts "-------------------------------------------------"

    while round.current_card_index < round.deck.count
        puts "This is card number #{round.current_card_index + 1} out of #{round.deck.count}"
        puts "Questions: #{round.current_card.question}"
        print "Answer: "
        guess = gets.chomp
        puts round.take_turn(guess).feedback
        puts ""
    end

    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct}%."
    puts "Math - #{round.percent_correct_by_category("Math")}% correct."
    puts "Geography - #{round.percent_correct_by_category("Geography")}% correct."
    puts "STEM - #{round.percent_correct_by_category("STEM")}% correct."

end

start(round_1)


