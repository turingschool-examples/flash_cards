require_relative './turn.rb'
require_relative './card.rb'

class Round
    attr_reader :deck, :turns, :current_card, :user_guesses, :number_correct, :card_number, :number_correct_by_category, :percent_correct, :percent_correct_by_category, :turn_number, :new_turn_category
    attr_writer :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @card_number = 0
        @turn_number = 1
        @number_correct = 0
        @number_correct_by_category = 0
        @user_guesses = []
        @current_card = current_card
        @percent_correct = 0.0
        @percent_correct_by_category = 0
        @new_turn_category = []
        @correct_by_category = Hash.new(0)
        
    end

    def current_card
        @current_card = @deck.cards[@card_number]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card) 
            @turns. << new_turn
            user_guesses << new_turn.correct? #returns true/false boolean

            if new_turn.correct?
                @number_correct += 1 
                @correct_by_category[current_card.category] += 1 #@correct_by_category hash tracks the number of correct guesses by category 
            end
            # require 'pry'; binding.pry
            @card_number += 1
            @turn_number += 1
        new_turn
    end

    def percent_correct 
        @percent_correct = ((@number_correct.to_f / @turns.length) * 100).round(2)
    end
        
    def number_correct_by_category(category) 
        @correct_by_category[category] #this pulls the category argument into the correct_by_category hash to identify the number of correct answers per category
    end

    def percent_correct_by_category(category) 
        total_in_category = @turns.count { |turn| turn.card.category == category} #use block code here - |turn| is the argument, and the block iterates over each turn in the @turns array
        #identifies whether the category of the card associated with each turn in the @turns array matches the cateegory of the argument passed into the method

        return 0.0 if total_in_category == 0 #don't care about empty categories 
        ((number_correct_by_category(category).to_f / total_in_category) * 100).round(2)
        
    end

    def unique_categories
        @deck.cards.map(&:category).uniq
    end

    def return_percent_correct_by_category
        unique_categories.each do |category|
            puts "#{category}: #{percent_correct_by_category(category)}%"
        end
    end

end
