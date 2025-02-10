class Round
    attr_reader :deck, :turns, :current_card, :current_card_index
    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card_index = 0 
        @current_card = deck.cards[@current_card_index]
        
    end 
    def take_turn(guess)
        turn = Turn.new(guess, @current_card) 
        @turns << turn
        @current_card_index += 1
        @current_card = deck.cards[@current_card_index]
        turn

    end
end