require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'

class Runner


    def initialize
        card_1 = Card.new("What is 5 + 5?", "10", :Math)
        card_2 = Card.new("What is Rachel's favorite animal?", "Owl", :Turing_Staff)
        card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
        card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
        @deck = Deck.new([card_1, card_2, card_3, card_4])
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

run = Runner.new
run.start


        

