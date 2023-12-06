require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

filename = "cards.txt"
cards = CardGenerator.new(filename).cards

deck = Deck.new(cards)

round = Round.new(deck)

def start(round)
    amount_of_cards = round.deck.cards.length
    count = 1

    puts "Welcome! You're playing with #{amount_of_cards} cards"
    puts "-----------------------------------------------------------------------"
    
    until round.deck.cards.length == 0
        puts "This is card number #{count} out of #{amount_of_cards}"
        puts "Question: #{round.current_card.question}"
        guess = gets.chomp

        turn = round.take_turn(guess)
        puts "#{turn.feedback}"

        count += 1
    end

    puts "******** Game Over! *************"
    puts "You had #{round.number_correct} correct guesses out of #{amount_of_cards} for a total score of #{round.percent_correct.to_i}%"
    
    turns = round.turns
    categories = turns.map {|turn| turn.card.category}
    categories.uniq.each {|category| puts "#{category} - #{round.percent_correct_by_category(category).to_i}%"}    
end
    



start(round)
