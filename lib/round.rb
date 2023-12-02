require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Round

    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @turns_taken = 0
    end

# may need to add a conditional statement or something here that would count the number of 
# cards in the deck and reset the number to zero in order to make the deck be repeatable once
# cards have been used in a turn
    def current_card
        @deck.cards[@turns_taken]
    end

    def take_turn(guess)
        taken_turn = Turn.new(guess, current_card)
        @turns_taken += 1
        @turns << taken_turn
        @turns[-1]
    end

    

    # I need to have the take turn method accept a string argument as the guess,
    # then create a new instance of Turn using that guess and the current card
    # Once that instance of turn is created, the take_turn method should return
    # that Turn. At the same time, it needs to add that turn into the @turns array
    # while also then taking the current card and pushing it to the back of the deck
    # i might need some separate methods I wasn't thinking I would need to call
    # within the take turn method
    
    # DRY Don't Repeat Yourself, save yourself the time by using the methods
    # you define in a class rather than rewriting the same code in a different method

end