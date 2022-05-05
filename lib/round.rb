require 'pry'

class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card; @deck.cards.first end

    def take_turn(guess)
        binding.pry
        current_card.guess
    end

end