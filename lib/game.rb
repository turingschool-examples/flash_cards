require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class Game
    attr_reader :deck, :rounds

    def initialize
        @deck = deck
        @rounds = []
    end

    def create_deck(user_deck)
        card_generator = CardGenerator.new(user_deck)
        @deck = Deck.new(card_generator.convert_to_cards)
    end

    def start
        @deck = welcome_message
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
        p 'Please choose from one of the decks below!'
        p 'Math, Geography or History'
        user_deck = gets.chomp.downcase
        decks_that_exist = ["geography", "history", "math"]
        until decks_that_exist.include?(user_deck)
            p 'Please choose a deck that exists.'
            user_deck = gets.chomp.downcase
        end
        create_deck(user_deck.concat(".txt").prepend("./decks/"))
    end
end
    