require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'

class Start

    attr_reader :round, :deck, :cards

    def initialize(round)
        @round = round
        @deck = @round.deck
        @cards = @deck.cards
        @card_count = 0
    end

    def start_game_message
        p "Welcome! You're playing with #{@cards.count} cards.\n-------------------------------------------"
    end

    def game_rounds
        (@cards.count).times do
            @card_count += 1
            puts "This is card number #{@card_count} out of #{@cards.count}."
            puts @round.current_card.question
        
            input1 = gets.chomp
            @round.take_turn(input1)
            @round.turns[-1].feedback
        end
    end
end