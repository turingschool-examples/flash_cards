require './lib/deck'
require './lib/card'
require './lib/turn'

class Round

    attr_reader :deck, 
                :current_card, 
                :round,
                :turns,
                :current_card_index,
                :take_turn


    def initialize(deck)
        @deck = deck
        @turns = []
        @round = round
        @current_card_index = 0 # Initialize current_card_index to start with the first card need this in order to read cards and keep order of what car goes next
        @number_correct = 0
    end

    def turns
        @turns
    end

    def round
        @round
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)  # Create a new turn with the current card and the guess
        @turns << new_turn  # Add the new turn to the list of turns
        @current_card_index += 1  # Move to the next card for the next turn
        new_turn  # Return the new turn
    end

    def current_card
        @deck.cards[@current_card_index] # Use the current_card_index to get the current card from the deck not any other class
    end

    def number_correct
        @turns.count { |turn| turn.correct? }
    end

    def number_incorrect
        @turns.count { |turn| !turn.correct? }
    end

    def percent_correct
        total_turns = @turns.count
        total_turns > 0 ? (number_correct.to_f / total_turns * 100) : 0
    end

    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.correct? && turn.card.category == category
        end # chceks each turn to see if `turn.correct?` returns true (meaning the guess was correct) and if the card associated with that turn (`turn.card`) is in teh specified category (`turn.card.category == category`)
    end
    
    def percent_correct_by_category(category)
        correct_by_category = number_correct_by_category(category).to_f
        total_category_turns = @turns.count { |turn| turn.card.category == category }
        total_category_turns > 0 ? (correct_by_category / total_category_turns * 100) : 0
    end

    def start
        puts "Welcome you're playing with #{deck.count} cards"
        puts "-------------------------------------------------"
        puts "This is card #{current_card_index + 1} out of #{deck.count}"
        puts "Question: #{current_card.question}"

        answer_1 = gets.chomp
        turn_1 = Turn.new(answer_1, current_card)
        take_turn(answer_1)
        puts turn_1.feedback
        puts "This is card #{current_card_index + 1} out of #{deck.count}"
        puts "Question: #{current_card.question}"

        answer_2 = gets.chomp
        turn_2 = Turn.new(answer_2, current_card)
        take_turn(answer_2)
        puts turn_2.feedback
        puts "This is card #{current_card_index + 1} out of #{deck.count}"
        puts "Question: #{current_card.question}"

        answer_3 = gets.chomp
        turn_3 = Turn.new(answer_3, current_card)
        take_turn(answer_3)
        puts turn_3.feedback
        puts "This is card #{current_card_index + 1} out of #{deck.count}"
        puts "Question: #{current_card.question}"

        answer_4 = gets.chomp
        turn_4 = Turn.new(answer_4, current_card)
        take_turn(answer_4)
        puts turn_4.feedback

        puts "****** Game over! ******"
        puts "You had #{number_correct} correct guesses out of #{deck.count} for a total score of #{percent_correct.to_i}%"
        puts "STEM - #{percent_correct_by_category(:STEM).to_i}% correct"
        puts "Turing Staff - #{percent_correct_by_category(:'Turing Staff').to_i}% correct"
        puts "Pop Culture - #{percent_correct_by_category(:'Pop Culture').to_i}% correct"
    end

end