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
        puts "-------------------------------------------------"
        ask_question
    end

    def ask_question
        puts "This is card number #{@current_card_index + 1} out of #{@deck.count}"
        puts "Questions: #{@current_card.question}"
        get_answer
    end

    def get_answer
        print "Answer: "
        guess = gets.chomp.downcase
        puts take_turn(guess).feedback
        puts ""
        if round_over?
            game_over
        else
            ask_question
        end
    end

    def round_over?
        @current_card_index == @deck.count
    end

    def game_over
        puts "****** Game over! ******"
        puts "You had #{@number_correct} correct guesses out of #{@deck.count} for a total score of #{percent_correct}%."
        puts "Math - #{percent_correct_by_category("Math")}% correct."
        puts "Geography - #{percent_correct_by_category("Geography")}% correct."
        puts "STEM - #{percent_correct_by_category("STEM")}% correct."
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
        (@number_correct.to_f / @turns.length * 100).to_i
    end

    def number_of_turns_by_category(category)
        @turns.count do |turn|
            turn.card.category == category
        end
    end
    
    def percent_correct_by_category(category)
        (number_correct_by_category(category).to_f / number_of_turns_by_category(category) * 100).to_i
    end

end