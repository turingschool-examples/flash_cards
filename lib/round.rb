require './lib/card'
require './lib/turn'
require './lib/deck'
# require 'pry'; binding.pry


class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards[0]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, @deck.cards[0])
        @turns.push(new_turn)
        return new_turn
        
    end




end