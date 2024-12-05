# round.rb - define the Round class

class Round
    attr_reader :deck, :turns, :current_card

    def initialize(deck)
        @deck = deck

        #Track the current card in the deck via an integer index.  May be unneeded later.
        @current_card_index = 0

        @current_card = deck[current_card_index]
        @turns = []
    end

    #Other methods

end