class Round
    attr_reader :deck, :turns, :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        @deck.cards[0]
    end

    def take_turn(guess, card = current_card)
        #this method does too many things
        turn = Turn.new(guess, card)
        @number_correct += 1 if turn.correct?
        @turns << turn
        @deck.cards.shift
        #refactor. let the object deck manipulate its own data,
        turn
    end


end
