# round.rb - define the Round class

class Round
    attr_reader :deck

    def initialize(deck)
        @deck = deck

        #Track the current card in the deck via an integer index.  May be unneeded later.
        @card_current_index = 0
    end

    #Other methods

end