require 'pry'

class Round
    attr_reader :deck, :turn

    def initialize(deck)
        @deck = deck 
        @turn = []
    end
end