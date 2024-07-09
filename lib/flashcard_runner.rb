require './card.rb'
require './turn.rb'
require './deck.rb'
require './round.rb'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "orangutan", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)

cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)

def start(deck)
    round = Round.new(deck)
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
    deck.count.times do
        puts "\nThis is card number #{round.turns.size + 1} out of #{deck.count}."
        puts round.current_card.question
        user_input = gets.chomp
        puts user_input
        turn_taken = round.take_turn(user_input)
        puts turn_taken.feedback
    end
    puts "\n****** Game over! ******"
    puts "\nYou had #{round.number_correct.to_i} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
        categories = deck.cards.map do |category|
            category.category
        end
        puts categories
        categories.each do |category|
            puts "#{category} - #{round.percent_correct_by_category(category).to_i} % correct"
        end
    


end

start(deck)


