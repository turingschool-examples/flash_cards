class Round
    attr_reader :deck, :turns
   
    def initialize(deck)
        @deck = deck
        @turns = []
        @card_index = 0
        @correct_counter = 0
    end

    def current_card
        card = @deck.cards[@card_index]
        return card
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @deck.cards.shift
        return new_turn
    end


end