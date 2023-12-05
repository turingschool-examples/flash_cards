require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
 
cards = [card_1, card_2, card_3]

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
