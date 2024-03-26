
class Flashcard_runner

    def initialize
        @card_number = 1
        @categories = []
    end

    def start(round)

    
        puts "Welcome! You're playing with #{round.deck.cards.length} cards.\n
    -------------------------------------------------"

        while @card_number <= round.deck.cards.length do
            puts "This is card number #{@card_number} out of #{round.deck.count}.\n
            Question: #{round.current_card.question}\n"

            guess = gets.chomp

            this_turn = round.take_turn(guess)

            puts this_turn.feedback

            @card_number += 1
        end

        round.turns.each {|turn|
        if turn.card.category
            @categories << turn.card.category
        end
        }
        
        categories_uniq = @categories.uniq
        
        puts "****** Game over! ******"
        puts "You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct}."

        category_statement_count = 0

        categories_uniq.each {|category|
            if categories_uniq.length >= category_statement_count
            puts "#{categories_uniq[category_statement_count]} - #{round.percent_correct_by_category(categories_uniq[category_statement_count])}% correct}"
            category_statement_count += 1
            end}
        end
end

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card1 = Card.new("What is 5 + 5?", "10", :STEM)
card2 = Card.new("What is Rachel's favorite animal?", "cat", "Turing Staff")
card3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
card4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
cards = [card1, card2, card3, card4]
deck = Deck.new(cards)
round = Round.new(deck)

test_flashcard = Flashcard_runner.new

test_flashcard.start(round)