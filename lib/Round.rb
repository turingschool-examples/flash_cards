require_relative 'Card'
require_relative 'Deck'

Class round 

    attr_reader 
    
    def initialize(deck)
        @deck = deck
    end

    def start 
        puts "Welcome to Brody's Flashcard game!"
    end

    def current_card
        @deck.draw_card
        puts "#{card.question}"
    end

    def pull card.new
        if current_card
            puts "Correct!"
        else
            puts "Wrong"
        end

    end
end
