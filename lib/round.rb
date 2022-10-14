class Round
    attr_reader :deck
    def initialize(deck)
        @deck = deck
    end

    # def take_turn(guess_string)
    #     @turn = Turn.new(guess_string, card)
    # end

    def turns
        turns = []
    end

    def current_card
        deck.cards[0]
    end

    def take_turn(guess)
        # require 'pry'; binding.pry
        turn = Turn.new(deck.cards[0], guess)
        turns << turn
    
    end



    # The take_turn method takes a string representing the guess. 
    # take_turn method should create a new Turn object with the appropriate guess and Card. 
    # take_turn method should store this new Turn, as well as return the new Turn from the take_turn method. 
    # When the take_turn method is called, the Round should move on to the next card in the deck.
end
