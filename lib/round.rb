class Round
    attr_reader :deck,
                :turns

    def initialize(deck)
        @deck=deck
        @turns=[]
    end

    def current_card
        @deck.cards[@turns.count]
    end

    def take_turn(guess)
      @turns << Turn.new(guess,@deck.cards[@turns.count])
      Turn.new(guess,@deck.cards[(@turns.count-1)])
      
    end

end