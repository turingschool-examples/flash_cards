require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

def start

  # card_1 = Card.new("TRUE or FALSE: We share 90% of our DNA with a slug", "FALSE", :STEM)
  # card_2 = Card.new("What is the longest river in the world?", "The Nile", :Geography)
  # card_3 = Card.new("What is the highest mountain in the world?", "Mount Everest", :Geography)
  # card_4 = Card.new("How many planets in our solar system?", "8", :STEM)
  filename = "cards.txt"
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
  puts "Geography - #{round.percent_correct_by_category(:Geography)}%"
end

start
