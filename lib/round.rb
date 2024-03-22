class Round
    attr_reader :deck, 
                :turns, 
                :current_card, 
                :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = deck.cards[0]
        @number_correct = 0
    end

    def take_turn(guess)
        turn = Turn.new(guess, @current_card)
        @turns.push(turn)
        deck.cards.shift
        @current_card = deck.cards[0]
        if turn.correct? == true
            @number_correct += 1
        end
        turn
    end
end