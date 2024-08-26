require_relative './turn.rb'
require_relative './card.rb'

class Round
    attr_reader :deck, :turns, :user_guesses, :number_correct, :card_number, :number_correct_by_category, :percent_correct, :percent_correct_by_category, :turn_number
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
        
    end

    def current_card
        @current_card = @deck.cards[@card_number]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card) #@current_card) #need to try to find a way for new_turn to pull in guess and card
            @turns. << new_turn
        user_guesses << new_turn.correct? #returns true/false boolean
            @number_correct += 1 if new_turn.correct?
            # require 'pry'; binding.pry
            @card_number += 1
            @turn_number += 1
        new_turn
    end

    def percent_correct 
        @percent_correct = ((@number_correct.to_f / @turns.length) * 100).round(2)
    end
        
    def number_correct_by_category(category)
        @number_correct.cards.category
        # category = @current_card.category
        # @number_correct_by_category = 
    end

    def percent_correct_by_category(category) #needed a method here because I couldn't include the parameter in the instance variable
        @percent_correct_by_category
    end
end

  # def number_correct_by_category
    #     if new_turn.correct? do 

    #     end
    #     correct_by_category = 
    #     += 1 if new_turn.correct?
    # end

    
    # def percent_correct_by_category
    #     @percent_correct_by_category = ((@number_correct_by_category.count.to_f / @turns.length) * 100).round(2)
    # end
