require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Create some Cards
# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start

class Game
    attr_reader :round,
                :start_message

    # def get_input
    #     @guess = gets.chomp.downcase.strip.delete(' ')
    # end

    # def start_game
    # end

    # def gameflow
    # end

    # def end_game
    # end

    def start_message
        @game_start = "Welcome! You're playing with #{Round.deck.count} cards.
        -------------------------------------------------
        This is card number 1 out of 4.
        Question: What is 5 + 5?"
    end
end