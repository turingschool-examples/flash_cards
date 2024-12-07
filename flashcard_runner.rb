require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'colorize'

colors = [:red, :green, :yellow, :blue, :magenta, :cyan]

def cputs(message, colors)
    puts message.colorize(colors.sample)
end

def cp(message, colors)
    puts message.inspect.colorize(colors.sample)
  end

card1 = Card.new("What is the name of the island in Jurassic Park?", "Isla Nublar", :Movies)
card2 = Card.new("What is the title of the Beatles' final album?", "Let it Be", :Music)
card3 = Card.new("Who played the hit-man Jules in Pulp Fiction?", "Samuel L Jackson", :Movies)
card4 = Card.new("What is the capital city of Brazil?", "Brasilia", :Geography)
card5 = Card.new("What is the smallest US State?", "Rhode Island", :Geography)
card6 = Card.new("Who wrote the 1971 hit song, What's Going On?", "Marvin Gaye", :Music)

cards = [card1, card2, card3, card4, card5, card6]

deck = Deck.new(cards)

round = Round.new(deck)

def start_game(round, colors)

    initial_card_count = round.deck.cards.size # added this variable for correct interpolation in Game Over message

    puts ""
    cputs("Welcome! You're playing Will's Trivia with #{initial_card_count} cards.", colors)
    puts ""
    cputs(">>>---- Game On! ----<<<", colors)
    puts ""
    # round.deck.cards.each do |card|
        while !round.deck.cards.empty? do
            cputs("This is card number #{round.turns.count + 1} out of #{initial_card_count}... 'cue Jeopardy theme song'...", colors)
            puts ""
            p round.current_card.question
            puts ""
            cputs("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", colors)
            puts ""
            guess = gets.chomp
            round.take_turn(guess)
            puts ""
            # puts round.turns.last.feedback 
            case [round.last_turn.correct?, round.last_turn.card.category] 
            when [true, :Movies]
                cp("Film buff huh? I bet you have a Criterion Collection subscription don't you?", colors)
            when [true, :Music]
                cp("Yep, wow, you must have an exquisite vinyl collection...", colors)
            when [true, :Geography]
                cp("I'm truly jealous of how worldly you are, take me with you next time?", colors)
            when [false, :Movies] 
                cp("Nope. You can use my Netflix password if you want.", colors)
            when [false, :Music]
                cp("Uh oh, we've got to get you some better headphones!", colors)
            when[false, :Geography] 
                cp("Welp! Time to invest in a globe!", colors)
            end
            puts ""
        end
    cputs("****** Game Over! ******", colors)
    puts ""
    cputs("You had #{round.number_correct} correct guesses out of #{initial_card_count} for a total score of #{round.percent_correct.round(0)}%", colors)
    puts ""
    
    cards_played = round.turns.map do |turn| #must use turns to access card objects, deck is depleted
        turn.card
    end
    
    categories = cards_played.map do |card|
        card.category
    end

    unique_categories = categories.uniq 

    unique_categories.each do |category|
        cputs("#{category} - #{round.percent_correct_by_category(category).round(0)}% correct", colors)
    end
    puts ""
end


start_game(round, colors)