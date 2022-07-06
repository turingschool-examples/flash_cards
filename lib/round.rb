class Round
    attr_reader :deck, :turns, :number_of_rounds, :number_correct
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_of_rounds = 0
        @number_correct = 0
    end

    def current_card
        deck.cards.at(number_of_rounds)
    end

    def take_turn(guess)
        current_turn = Turn.new(guess, current_card)
        turns << current_turn
        
    end

end
