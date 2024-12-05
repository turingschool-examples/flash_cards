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

    def take_turn(guess)
        #Create turn instance, given user's input into 'guess' string
        # turns << Turn.new(guess, @current_card)
        new_turn = Turn.new(guess, @current_card)
        @turns << new_turn

        #Advance to the next card in the deck before returning
        @current_card_index += 1
        @current_card = deck[current_card_index]

        return @current_card
    end


end