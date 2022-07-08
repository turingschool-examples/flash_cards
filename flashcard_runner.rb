require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

def start
  filename = "./lib/cards.txt"
  cards = CardGenerator.new(filename).cards
  deck = Deck.new(cards)
  round = Round.new(deck)

  puts "Welcome! You're playing with #{deck.count} cards"
  i = 1
  deck.cards.each do |card|
    puts "This is card number #{i} out of #{deck.count}"
    puts "Question: #{round.current_card.question}"
    given_answer = gets.chomp
    round.take_turn(given_answer)
    puts round.turns.last.feedback
    i += 1
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}%."
  puts "STEM - #{round.percent_correct_by_category(:STEM)}%"
  puts "Geography - #{round.percent_correct_by_category(:TuringStaff)}%"
end

start
