class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @card_index = 0
        @turn_counter = 0
    end

    def current_card
        require 'pry'; binding.pry
        card = @deck.cards[@card_index]
        return card  
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @card_index += 1
        return new_turn
       
    end
end