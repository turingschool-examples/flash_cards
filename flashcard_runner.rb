require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'

def start
    card_1 = Card.new("What fish can generate an electrical discharge up to 600 volts?", "Electric eel", :STEM)
    card_2 = Card.new("What dystopian novel did George Orwell publish in 1949?", "1984", :Literature)
    card_3 = Card.new("Which country did the US buy Florida from?", "Spain", :History)
    card_4 = Card.new("Where does The Jungle Book take place?", "India", :Literature)
    card_5 = Card.new("What color is a giraffe's tongue?", "Black", :STEM)
    cards = [card_1, card_2, card_3, card_4, card_5]
    deck = Deck.new(cards)
    round = Round.new(deck)

    puts "Welcome! You're playing with #{round.deck.count} cards."
    puts "-------------------------------------------------------------"
    puts "This is card number #{round.turns.count + 1} out of #{round.deck.count + round.turns.count}."
    puts "Question: #{round.deck.cards[0].instance_variable_get(:@question)}"
    answer_1 = gets.chomp
    turn_1 = Turn.new(answer_1, round.deck.cards[0])
    puts turn_1.feedback
    round.take_turn(answer_1)
    puts "This is card number #{round.turns.count + 1} out of #{round.deck.count + round.turns.count}."
    puts "Question: #{round.deck.cards[0].instance_variable_get(:@question)}"
    answer_2 = gets.chomp
    turn_2 = Turn.new(answer_2, round.deck.cards[0])
    puts turn_2.feedback
    round.take_turn(answer_2)
    puts "This is card number #{round.turns.count + 1} out of #{round.deck.count + round.turns.count}."
    puts "Question: #{round.deck.cards[0].instance_variable_get(:@question)}"
    answer_3 = gets.chomp
    turn_3 = Turn.new(answer_3, round.deck.cards[0])
    puts turn_3.feedback
    round.take_turn(answer_3)
    puts "This is card number #{round.turns.count + 1} out of #{round.deck.count + round.turns.count}"
    puts "Question: #{round.deck.cards[0].instance_variable_get(:@question)}"
    answer_4 = gets.chomp
    turn_4 = Turn.new(answer_4, round.deck.cards[0])
    puts turn_4.feedback
    round.take_turn(answer_4)
    puts "This is card number #{round.turns.count + 1} out of #{round.deck.count + round.turns.count}"
    puts "Question: #{round.deck.cards[0].instance_variable_get(:@question)}"
    answer_5 = gets.chomp
    turn_5 = Turn.new(answer_5, round.deck.cards[0])
    puts turn_5.feedback
    round.take_turn(answer_5)
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct.round}%."
    puts "STEM - #{round.percent_correct_by_category(:STEM).round}% correct"
    puts "Literature - #{round.percent_correct_by_category(:Literature).round}% correct"
    puts "History - #{round.percent_correct_by_category(:History).round}% correct"
end

start