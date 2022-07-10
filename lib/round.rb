class Round
    attr_reader :deck, :turns, :current_card

    def initialize(deck) 
        @deck = deck
        @turns = []
        @card_index = 0
    end

    def current_card
        @deck.cards[@card_index]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        @card_index += 1
        turn
    end

    def number_correct
        number_correct = 0
        if turns.each do |turn|
            number_correct += 1
            end
        end
    number_correct
    end

    
end
