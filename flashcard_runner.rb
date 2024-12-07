require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new("What is the name of the island in Jurassic Park?", "Isla Nublar", :Movies)
card2 = Card.new("What is the title of the Beatles' final album?", "Let it Be", :Music)
card3 = Card.new("Who played the hit-man Jules in Pulp Fiction?", "Samuel L Jackson", :Movies)
card4 = Card.new("What is the capital city of Brazil?", "Brasilia", :Geography)
card5 = Card.new("What is the smallest US State?", "Rhode Island", :Geography)
card6 = Card.new("Who wrote the 1971 hit song, What's Going On?", "Marvin Gaye", :Music)

cards = [card1, card2, card3, card4, card5, card6]

deck = Deck.new(cards)

round = Round.new(deck)

def start_game(round)

    initial_card_count = round.deck.cards.size

    puts ""
    puts "Welcome! You're playing Will's Trivia with #{initial_card_count} cards."
    puts ""
    puts ">>>---- Game On! ----<<<"
    puts ""
    # round.deck.cards.each do |card|
        while !round.deck.cards.empty? do
            puts "This is card number #{round.turns.count + 1} out of #{initial_card_count}... 'cue Jeopardy theme song'..."
            puts ""
            p round.current_card.question
            puts ""
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts ""
            guess = gets.chomp
            round.take_turn(guess)
            puts ""
            # puts round.turns.last.feedback 
            case [round.last_turn.correct?, round.last_turn.card.category] 
            when [true, :Movies]
                p "Film buff huh? I bet you have a Criterion Collection subscription don't you?"
            when [true, :Music]
                p "Yep, wow, you must have an exquisite vinyl collection..."
            when [true, :Geography]
                p "I'm truly jealous of how worldly you are, take me with you next time?"
            when [false, :Movies] 
                p "Nope. You can use my Netflix password if you want."
            when [false, :Music]
                p "Uh oh, we've got to get you some better headphones!"
            when[false, :Geography] 
                p "Welp! Time to invest in a globe!"
            end
            puts ""
        end
    puts "****** Game Over! ******"
    puts ""
    puts "You had #{round.number_correct} correct guesses out of #{initial_card_count} for a total score of #{round.percent_correct.round(0)}%"
    puts ""
    
    cards_played = round.turns.map do |turn|
        turn.card
    end
    
    categories = cards_played.map do |card|
        card.category
    end

    unique_categories = categories.uniq 

    unique_categories.each do |category|
        puts "#{category} - #{round.percent_correct_by_category(category).round(0)}% correct"
    end
    puts ""
end


start_game(round)