require './lib/deck'
require './lib/turn'

class Round

    attr_reader :deck,
                :current_card,
                :turns,
                :number_correct,
                :current_card_index

    def initialize(deck)
        @deck = deck
        @current_card_index = 0
        @current_card = @deck.cards[0]
        @turns = []
        @number_correct = 0
    end

    def start
        puts "Welcome! You're playing with #{@deck.count} cards."
        puts "Type 'quit' to exit the program."
        puts "-------------------------------------------------"
            
        round_over? ? game_over : ask_question
    end

    def ask_question
        puts "This is card number #{@current_card_index + 1} out of #{@deck.count}"
        puts "Questions: #{@current_card.question}"
        get_answer
    end

    def get_answer
        print "Answer: "
        guess = gets.chomp

        while guess == ""
            print "You did no enter an answer. Try again: "
            guess = gets.chomp
        end

        if guess == 'exit' || guess == 'quit'
            puts ""
            game_over
            exit
        end

        puts take_turn(guess).feedback
        puts ""

        round_over? ? game_over : ask_question
    end

    def round_over?
        @current_card_index == @deck.count
    end

    def unique_categories
        categories = []
        @deck.cards.each do |card|
            categories << card.category
        end
        categories.uniq{ |category| category }
    end

    def game_over
        puts "****** Game over! ******"
        puts "You had #{@number_correct} correct guesses out of #{@deck.count} for a total score of #{percent_correct}%."
        # puts "Math - #{percent_correct_by_category("Math")}% correct."
        # puts "Geography - #{percent_correct_by_category("Geography")}% correct."
        # puts "STEM - #{percent_correct_by_category("STEM")}% correct."
        unique_categories.each do |category|
            puts "#{category} - #{percent_correct_by_category(category)}% correct."
        end
    end

    def take_turn(guess)
        turn = Turn.new(guess, @current_card)
        @turns << turn
        if turn.correct?
            @number_correct += 1
        end
        @current_card_index += 1
        @current_card = @deck.cards[@current_card_index]
        turn
    end

    def number_correct_by_category(category)
        @turns.count do |turn|
           turn.card.category == category && turn.correct?
        end
    end

    def percent_correct
        if turns.length == 0
            0
        else
            (@number_correct.to_f / @turns.length * 100).to_i
        end
    end

    def number_of_turns_by_category(category)
        @turns.count do |turn|
            turn.card.category == category
        end
    end
    
    def percent_correct_by_category(category)
        if number_of_turns_by_category(category) == 0
            0
        else
            (number_correct_by_category(category).to_f / number_of_turns_by_category(category) * 100).to_i
        end
    end

end