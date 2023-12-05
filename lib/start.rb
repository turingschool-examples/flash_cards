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
            p "This is card number #{@card_count} out of #{@cards.count}."
            p @round.current_card.question
        
            input1 = gets.chomp
            @round.take_turn(input1)
            @round.turns[-1].feedback
        end
    end

    def category_selector
        unique_categories = []
        @cards.each do |card|
            unique_categories << card.category  
        end
        unique_categories.uniq!
    end

    def game_over_message
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@cards.count} for a total score of #{@round.percent_correct}%."
    category_selector.each do |category|
        puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
        end
    end

    def start
        start_game_message
        game_rounds
        game_over_message
    end
end