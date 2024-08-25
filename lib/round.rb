require_relative './turn.rb'
require_relative './card.rb'

class Round
    attr_reader :deck, :turns, :user_guesses, :number_correct, :card_number, :number_correct_by_category, :percent_correct, :percent_correct_by_category

    def initialize(deck)
        @deck = deck
        @turns = []
        @card_number = 0
        @number_correct = 0
        @number_correct_by_category = 0
        @user_guesses = []
        @current_card = current_card
        @percent_correct = 0
        @percent_correct_by_category = 0
    end

    def turns
        @turns
    end

    def user_guesses
        @user_guesses
    end

    def current_card
        @current_card = @deck.cards[@card_number]
    end

    def number_correct_by_category(category)
        @number_correct_by_category
    end

    def percent_correct_by_category(category)
        @percent_correct_by_category
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn 
        @user_guesses << new_turn.correct? #returns true/false boolean
        @number_correct += 1 if new_turn.correct?
        @number_correct_by_category += 1 if new_turn.correct?
        @card_number += 1
        @percent_correct = ((@number_correct.to_f / @turns.length) * 100).round(2)
        @percent_correct_by_category = ((@number_correct_by_category.to_f / deck.cards.length) * 100).round(2)
        new_turn
    end
end