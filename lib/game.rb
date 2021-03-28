require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game
    attr_reader :card_1,
                :card_2,
                :card_3,
                :card_4,
                :deck,
                :round,
                :guess

    def initialize
        @card_1 = Card.new("What is Alex's dog's name?", "Wanda", :Dogs)
        @card_2 = Card.new("What is Alicia's cat's name?", "Tiger", :Cats)
        @card_3 = Card.new("What is Leigh's favorite food?", "Bagels", :Food)
        @card_4 = Card.new("What is Leigh's cats's name?", "Dalia", :Cats)
        @deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
        @round = Round.new(@deck)
    end

    def start_message
        "\n~~~~~~~~~~~~~~~~~ 🤗 Welcome! 🤗 ~~~~~~~~~~~~~~~~~
        \nYou're playing with #{@deck.count} cards.
        \n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end

    def questions
        "\nThis is card number #{@round.turns.count + 1} out of #{@deck.count}.
        \n#{@round.current_card.question}\n"
    end

    def input
        gets.chomp.downcase.strip.delete(' ').capitalize
    end

    def start_game
        print start_message
        gameflow
        print end_game
    end

    def gameflow
        until @round.turns.count == @deck.count
            print questions
            @round.take_turn(input)
            print "\n#{@round.turns.last.feedback}\n\n"
        end
    end

    def end_game
        "\n\n~~~~~~~~~~~~~~~~~ 😭 Game over!😭 ~~~~~~~~~~~~~~~~~
        \nYou had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct.to_i}%.
        \nDogs - #{@round.percent_correct_by_category(:Dogs)}% correct
        \nCats - #{@round.percent_correct_by_category(:Cats)}% correct
        \nFood - #{@round.percent_correct_by_category(:Food)}% correct"
    end
end