require './lib/round.rb'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'

cards = []

File.open('./trivia.txt', 'r') do |file|
    file.each_line do |line|
        question, answer, category = line.chomp.split(', ', 3)
        card = Card.new(question, answer, category)
        cards << card
    end
end

game_deck = Deck.new(cards)


class Game
    attr_reader :card_number,
                :round,
                :total,
                :categories

    def initialize(deck)
        @deck = deck
        @card_number = 1
        @total = @deck.deck.count
        @categories =  @deck.all_categories

    end

    def start
        puts "Welcome, You are playing with #{@total} cards."
        @round = Round.new(@deck)
        gameplay
    end

    def gameplay
        while @card_number < @total + 1
            player_guessing
        end

        game_over
    end

    def player_guessing
        puts "This is card number #{@card_number} of #{@total} "
        puts "#{@round.current_card.question}"
        player_guess = gets.chomp
        @round.take_turn(player_guess)
        @card_number += 1
    end

    def game_over
        puts 'GAME OVER!!!'
        puts "You had #{@round.number_correct} out of #{@total} for a total score of #{@round.percent_correct.round(1)}"
        # require 'pry'; binding.pry
        categories.each do |category|
            puts "#{category} - #{@round.percent_correct_by_category(category)}"
        end

    end

end

# card_1 = Card.new('What is the capital of Texas?', 'Austin', :Geography)
# card_2 = Card.new('The reason why drones have their engines go in alternating directions is because of?', 'Centripetal Force', :STEM)
# card_3 = Card.new('Cats are in what animal family (reminder Kingdom > Phylum > class > order > family)?', 'Felidae', :STEM)
# cards = [card_1, card_2, card_3]
# game_deck = Deck.new(cards)


game = Game.new(game_deck)

game.start