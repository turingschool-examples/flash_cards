require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class GameStart
    def start
        card_1 = Card.new("Who is the best character in AOT?", "Zeke", :Anime)
        card_2 = Card.new("Who won the super bowl?", "Tampa Bay", :Sports)
        card_3 = Card.new("Best swordsman of the seven ninja swordsmen of the mist?", "Zabuza", :Anime)
        card_4 = Card.new("Who is the bad guy in all the Resident Evil games?", "Albert Wesker", :VideoGames)
        @cards = [card_1, card_2, card_3, card_4]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
        puts "Welcome! You're playing with #{@deck.count} cards."
        puts "-----------------------------------------------------"
        loop_the_game
    end

    def loop_the_game
        until @round.turns.length == @deck.count
            guess_input
        end
        end_game
    end
    
    def guess_input
        puts "This is card number #{@round.current_card_number} out of #{@deck.count}."
        puts "Question: #{@round.current_card.question}?"
        method_name(gets.chomp.downcase)
    end

    def method_name(guess_input)
        @round.take_turn(guess_input)
        feedback(guess_input)
    end

    def feedback(guess_input)
        puts @round.turns[-1].feedback
    end

    def end_game
        puts "****** Game over! ******"
        puts "You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct}%."
        puts "Anime - #{@round.percent_correct_by_category(:Anime)}% correct"
        puts "Sports - #{@round.percent_correct_by_category(:Sports)}% correct"
        puts "Video Games - #{@round.percent_correct_by_category(:VideoGames)}% correct"
    end
end