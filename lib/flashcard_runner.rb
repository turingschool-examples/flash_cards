require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/card_generator.rb'

class Runner

    def initialize
        cardset = CardGenerator.new('cards.txt').temp_deck
         @deck = Deck.new(cardset)
         @round = Round.new(@deck)
    end

   def start
        

        puts "\n \n"
        puts "Welcome! You're playing with #{@round.deck.count} cards."
        puts "-------------------------------------------------"
        while (@round.card_index < @round.deck.count) do
            puts "This is card #{(@round.card_index) + 1} out of #{@round.deck.count}."
            puts "Question: #{@round.current_card.question}"
            input = gets.chomp
            (@round.take_turn(input)).feedback
        end
        puts "\n"
        puts "****** Game over! ******"
        puts "You had #{@round.number_correct} correct guess out of #{@round.deck.count} for a total score of #{(@round.percent_correct).to_i}%"
        
        
        cats = []

        @deck.cards.each do |card|
            if (cats.include?(card.category)) != true
                cats << card.category
            end
        end

        cats.each do |cat|
            puts "#{cat.to_s.tr('_',' ')} - #{@round.percent_correct_by_category(cat).to_i}% correct"
        end
        puts "\n"

    end
end

game = Runner.new
game.start


        

