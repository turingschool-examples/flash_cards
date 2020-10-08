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
        puts "--------------------------------------------------"
        puts "This is card number #{round.turns.count + 1} out of #{cards.count}."
        puts round.current_card.question
        guess = gets.chomp.to_s
        new_turn = round.take_turn(guess)
        puts new_turn.feedback

        puts "This is card number #{round.turns.count + 1} out of #{cards.count}."
        puts round.current_card.question
        guess2 = gets.chomp.to_s
        new_turn = round.take_turn(guess2)
        puts new_turn.feedback

        puts "This is card number #{round.turns.count + 1} out of #{cards.count}."
        puts round.current_card.question
        guess3 = gets.chomp.to_s
        new_turn = round.take_turn(guess3)
        puts new_turn.feedback

        puts "----------------- Game Over! ------------------"
        puts "You had #{round.number_correct} out of #{cards.count} for a total of #{round.percent_correct}%."
        puts "#{cards[0].category} - #{round.percent_correct_by_category(cards[0].category)} % correct"
        puts "#{cards[1].category} - #{round.percent_correct_by_category(cards[1].category)} % correct"
        puts "#{cards[2].category} - #{round.percent_correct_by_category(cards[2].category)} % correct"
    end

    start