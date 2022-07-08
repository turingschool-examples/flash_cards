class Round
    attr_reader :deck, :turns, :cards
    
    def initialize (deck)
        @deck = deck
        @cards = cards
        @turns = []
    end

    def current_card
        deck.cards[0] #output in instructions is @answer, @question, @topic
        # deck.cards.rotate(1) 
    end
end