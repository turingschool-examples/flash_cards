require 'turn.rb'

class Round
    attr_reader :deck, :turns, :user_guesses, :number_correct, :card_number

    def initialize(deck)
        @deck = deck
        @turns = []
        @card_number = 0
        @number_correct = 0
        @user_guesses = []
    end

    def turns
        @turns
    end

    def user_guesses
        @user_guesses
    end

    def current_card
        @deck.cards[@card_number]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @user_guesses << new_turn.correct?
        @number_correct += 1 if new_turn.correct?
        @card_number += 1
        new_turn
    end
end

    # def number_correct
        
    # end

    # # def last

    # end

    # def feedback

    # end



# def take_turn(guess)
#     new_turn = Turn.new(guess,@deck.cards[@turns.count])
#     @turns << new_turn
#     new_turn
# end

# turns.length = 0 (turns.length should go up one every turn)


# turn should pull the card and return it to the end of the array

