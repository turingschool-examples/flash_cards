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

    def correct?()
        #Check if guess is identical to card's answer
        #Check only lowercase to relax strict string matching requirements
        @guess == card.answer.downcase
    end

    def feedback()
        #Provide written feedback based on whether the guess was correct or not
        #NOTE: I'd rather utilize calling 'correct?()', but it requires a self-reference...
        #Alternate approach: pass a boolean 'correct' as an arg here and then run if/else logic
        if @guess == card.answer.downcase
            puts "Correct!"
        else
            puts "Incorrect."
        end
    end
end