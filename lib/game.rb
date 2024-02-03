require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class Game
    attr_reader :deck

    def initialize
        @deck = create_deck
    end

    def create_deck
        card_generator = CardGenerator.new('cards.txt')
        deck = Deck.new(card_generator.convert_to_cards)
    end

    def start
        welcome_message
        play = true
        while play do
            round = Round.new(@deck)
            round.play_round
            p "Type 'Yes' if you want to play another round."
            round_over_answer = gets.chomp
            unless round_over_answer.downcase == "yes"
                play = false
            end
        end
    end

    def welcome_message
        p 'Welcome to the Flash Card game!'
        p '-------------------------------------------------'
    end
end