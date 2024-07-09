require './card'
require './turn'
require './deck'
require './round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?","Coral", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?","nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
deck = Deck.new([card_1, card_2, card_3, card_4])

def start(deck)
    round = Round.new(deck)
    puts "Welceme! You're playing with #{deck.count} cards"
    puts "-------------------------------------------------"
    deck.count.times do
        puts "\nThis is card number #{round.turns.count + 1} out of #{deck.count}."
        puts round.current_card.question
        user_input = gets.chomp 
        # puts user_input
        turn = round.take_turn(user_input)
        puts turn.feedback
    end
    puts "\n****** Game over! ******"
    puts "\nWow! You finished! That was fun!!!!"
    puts "You had #{round.number_correct.to_i} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%"
    categories = deck.cards.map do |category|
        category.category
    end
    categories.each do |category|
        puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
    end
end

start(deck)

#line that says how many right and how many turns were taken
#separate lines showing the percent correct by category