require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Round

    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        taken_turn = Turn.new(guess, (@deck.cards.first))
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
end
