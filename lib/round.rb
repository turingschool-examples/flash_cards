require './lib/turn'
require 'pry'

class Round
    attr_reader :deck, :turns, :cards
    
    def initialize (deck)
        @deck = deck
        @cards = cards
        @turns = []
        # puts "Hello"
        # input = gets.chomp
        # puts input + "!!!"
    end

    def current_card
        deck.cards[0] #output in instructions is @answer, @question, @topic
        # deck.cards.rotate(1) 

    end

    def take_turn(guess)
        p new_turn = Turn.new(guess, deck.cards[0])
        # binding.pry
    end
    # p new_turn = Turn.new(guess, deck.cards[0])


    # def new_turn
    #     @Turn
    # end

end



# Round.new(nil)
