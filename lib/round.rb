class Round
    attr_reader :deck, :turns
    def initialize(deck, turns)
        @deck = deck
        @turns = []
    end

    def take_turn(guess) do

