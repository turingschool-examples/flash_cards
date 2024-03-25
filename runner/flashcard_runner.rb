require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new("What is 5 + 5?", "10", :STEM)
card2 = Card.new("What is Rachel's favorite animal?", "cat", "Turing Staff")
card3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
card4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
cards = [card1, card2, card3, card4]
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
    card_number = 1
    # round = round

    while card_number <= round.deck.cards.length do
        puts "This is card number #{card_number} out of #{round.deck.count}.\n
        Question: #{round.current_card.question}\n"

        guess = gets.chomp

        this_turn = round.take_turn(guess)

        puts this_turn.feedback

        card_number += 1
    end
    
    categories = []

# returns cards but not category
    # categories = round.deck.cards.select {|card| card.category}

# trying make variable for category to keep DRY
    # category = round.turns.card.category
    # round.turns.each {|turn|
    #     if category
    #         categories << category
    #     end
    #     }

# working method after .uniq
    round.turns.each {|turn|
    if turn.card.category
        categories << turn.card.category
    end
    }
    
    categories_uniq = categories.uniq

    puts categories_uniq
    
    puts "****** Game over! ******
    You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct}.
    #{categories_uniq[0]} - #{round.percent_correct_by_category(categories_uniq[0])}% correct
    Turing Staff - #{round.percent_correct_by_category("Turing Staff")}% correct
    Pop Culture - #{round.percent_correct_by_category("Pop Culture")}% correct"

#working non-interpolated category statement
    # puts "****** Game over! ******
    # You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct}.
    # STEM - #{round.percent_correct_by_category(:STEM)}% correct
    # Turing Staff - #{round.percent_correct_by_category("Turing Staff")}% correct
    # Pop Culture - #{round.percent_correct_by_category("Pop Culture")}% correct"
end

# categories = @turns.select {|turn| turn.card.category}
# puts categories

puts "Welcome! You're playing with #{round.deck.cards.length} cards.\n
-------------------------------------------------"

start(round)

# puts "Try Again?
# Enter 'yes' or 'no'"

# answer= get.chomp

# def try_again(answer)
#     if answer == "yes"
#         start(round)
#     elsif answer == "no"
#         puts "Hope you had fun."
#     else 
#         puts "Invalid answer. Reload to play again."
#     end
# end

# try_again(answer)