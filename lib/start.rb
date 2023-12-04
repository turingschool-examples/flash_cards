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
    end

    def start_game_message
        p "Welcome! You're playing with #{@cards.count} cards.\n-------------------------------------------"
    end
end