class Round
    attr_reader :deck, :turns, :current_card
    def initialize(deck)
        @deck = deck 
        @turns = []

        @current_card = deck.cards.first
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        @current_card = @deck.cards.rotate.first
    end

    

end

