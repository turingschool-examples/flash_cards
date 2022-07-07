require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :Math)
card_2 = Card.new("What is the capital of Sri Lanka", "Sri Jayawardenapura Kotte", :Geography)
card_3 = Card.new("What mountain range contains Mt Everest?", "Himalayas", :Geography)
card_4 = Card.new("What is 5!", "120", :Math)
card_5 = Card.new("What is the largest Planet?", "Jupiter", :STEM)
card_6 = Card.new("What is the chemical symbol for Potassium?", "K", :STEM)
card_7 = Card.new("What is the largest Freshwater lake in the world?", "Lake Superior", :Geography)

cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7]

deck_1 = Deck.new(cards)

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
    puts "Math - #{round.percent_correct_by_category(:Math)}% correct."
    puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct."
    puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct."

end

start(round_1)


