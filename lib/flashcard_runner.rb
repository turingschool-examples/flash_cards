require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Colorado?",
  "Denver",
  :Geography)
card_2 = Card.new("What is Sierra's favorite color?",
  "Orange",
  :Random)
card_3 = Card.new("Which state is known for potatoes, trout, and precious stones?",
  "Idaho",
  :Geography)
card_4 = Card.new("What is the sum of 55 and 45?",
  "100",
  :Math)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  card_total = round.deck.count
  counter = 0

  puts "Welcome! You're playing with #{card_total} cards."
  puts "-"*50

  while(counter < card_total)
    counter += 1
    puts "This is card number #{counter} out of #{card_total}."
    puts "Question: #{round.current_card.question}"
    print ">"
    user_guess = gets.chomp
    round.take_turn(user_guess.capitalize)
    puts round.turns.last.feedback
  end
  
puts "***** Game over! *****"
puts "You had #{round.number_correct} guesses out of #{card_total} for a total score of #{round.percent_correct}%."
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
puts "Random - #{round.percent_correct_by_category(:Random)}% correct"
puts "Math - #{round.percent_correct_by_category(:Math)}% correct"
end

start(round)
