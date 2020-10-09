require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

   
    def start 
        cards = CardGenerator.new("cards.txt").cards
        deck = Deck.new(cards)
        round = Round.new(deck)

        puts "Welcome! You're playing with #{cards.count} cards.".center(60)
        puts "You can add or remove cards through cards.txt file.".center(60)
        puts "-".center(60, "-")
        puts "Press enter to begin".center(60)
        gets.chomp

        deck.count.times do 
        puts "This is card number #{round.turns.count + 1} out of #{cards.count}.".center(60)
        puts round.current_card.question.center(60)
        guess = gets.chomp.to_s
        new_turn = round.take_turn(guess)
        puts
        puts new_turn.feedback.center(60)
        puts "Press enter to continue".center(60)
        gets.chomp
        end

        puts "Game Over!".center(60, "-")
        puts "Thank you for playing".center(60)
        puts "You had #{round.number_correct} out of #{cards.count} for a total of #{round.percent_correct}%.".center(60)
        cards.each do |card|
            puts "#{card.category} - #{round.percent_correct_by_category(card.category)} % correct".center(60)
        end
    end

    start