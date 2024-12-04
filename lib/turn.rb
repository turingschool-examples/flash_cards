# turn.rb - defines the Turn class

class Turn
    #Track the current card displayed and the player's guess
    attr_reader :guess, :card       # Not sure if I want 'card' also present here...

    #Initialize method
    def initialize(guess_string, card)
        @guess = guess_string
        @card = card
        #Again, no explicit error checking yet (e.g. if 'guess' is not a string)
    end

    #Other methods

    def guess()
        #Get guess member variable (I suppose this means attr_reader isn't needed above?)
        @guess
    end

    def card()
        @card
    end



end