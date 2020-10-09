require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

   
    def start 
        cards = CardGenerator.new("cards.txt").cards
        deck = Deck.new(cards)
        round = Round.new(deck)

        puts "Welcome! You're playing with #{cards.count} cards."
        puts "You can add or remove cards through cards.txt file."
        puts "--------------------------------------------------"
        puts "          Press enter to begin"
        gets.chomp

        deck.count.times do 
        puts "This is card number #{round.turns.count + 1} out of #{cards.count}."
        puts round.current_card.question
        guess = gets.chomp.to_s
        new_turn = round.take_turn(guess)
        puts
        puts new_turn.feedback
        puts "Press enter to continue"
        gets.chomp
        end

        puts "----------------- Game Over! ------------------"
        puts "            Thank you for playing"
        puts "You had #{round.number_correct} out of #{cards.count} for a total of #{round.percent_correct}%."
        #iterate below
        cards.each do |card|
            puts "#{card.category} - #{round.percent_correct_by_category(card.category)} % correct"
        end
    end

    start