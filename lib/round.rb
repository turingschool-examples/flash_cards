require './lib/turn'

class Round
    attr_reader :deck, :turns :current_card :number_correct
    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = round.deck.first
        @number_correct = 0
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        @number_correct +=1 if deck.cards.correct?
        @current_card = round.decl[@turns.count]
        turn    
    end
end