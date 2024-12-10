require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

    new_card_1 = Card.new("What is 5+5?", "10", :STEM)
    new_card_2 = Card.new("What is Rachel's favorite animal?", "Chicken", "Turing Staff")
    new_card_3 = Card.new("What is Mike's middle name?", "Nobody knows","Turing Staff")
    new_card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber","Pop Culture")

    new_cards = [new_card_1, new_card_2, new_card_3, new_card_4]
    deck = Deck.new(new_cards)
    round = Round.new(deck) 

def start(round)
    puts "Welcome! You're playing with #{round.deck.count} cards."
    puts "-------------------------------------------------"
    puts "This is card number 1 out of 4."
    puts "Question: #{round.current_card.question}"
    round.take_turn(gets.chomp.upcase.strip)
    puts round.turns.last.feedback 
    
    puts "This is card number 2 out of 4"
    puts "Question: #{round.current_card.question}"
    round.take_turn(gets.chomp.upcase.strip)
    puts round.turns.last.feedback 

    puts "This is card number 3 out of 4"
    puts "Question: #{round.current_card.question}"
    round.take_turn(gets.chomp.upcase.strip)
    puts round.turns.last.feedback 

    puts "This is card number 4 out of 4"
    puts "Question: #{round.current_card.question}"
    round.take_turn(gets.chomp.upcase.strip)
    puts round.turns.last.feedback 

    puts "****** Game Over! ******"
    puts "You had #{round.number_correct} out of 4 for a total score of #{round.percent_correct}"
    puts "STEM - #{round.percent_correct_by_category(:STEM)}"
    puts "Turing Staff - #{round.percent_correct_by_category("Turing Staff")}"
    puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")}"
end
start(round)
