require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'


class Round
    attr_reader :deck , :turns, :current_card
    def initialize(deck, turns = [])
        @deck = deck
        @turns = turns
        @current_card = current_card
    end
    def take_turn

    end
    
end