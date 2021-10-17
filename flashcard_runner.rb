require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Seth's favorite color?", "Orange", "Student")
card_3 = Card.new("What is the capital of Virginia?", "Richmond", :Geography)
card_4 = Card.new("What is the capital of the US?", "Washington DC", :Geography)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  counter = 1
  puts "Welcome! You're playing with #{round.deck.count} cards"
  while(counter <= round.deck.count)
    puts "-" * 50
    puts "This is card number #{counter} out of #{round.deck.count}."
    puts round.deck.cards[0].question
    guess = gets.chomp
    turn = round.take_turn(guess)
    puts turn.feedback
    counter += 1
  end
end

start(round)
puts "************* Game Over! ************"
puts "You had #{round.number_correct} correct out of #{round.deck.count} for a total."
puts "Score of #{round.percent_correct}%"
puts "STEM - #{round.percent_correct_by_category(:STEM)}%"
puts "Student - #{round.percent_correct_by_category("Student")}%"
puts "Geography - #{round.percent_correct_by_category(:Geography)}%"
