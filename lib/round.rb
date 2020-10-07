class Round
    attr_reader :deck 
    attr_accessor :turn, :number_correct
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end
    
    def current_card
        current_card = @deck.cards[@turns.count]
    end

    def take_turn(guess)
        @number_correct += 1  if guess == current_card.answer
        @turns << Turn.new(guess, current_card)
        @turns.last
    end

    def turns 
        @turns
    end

end