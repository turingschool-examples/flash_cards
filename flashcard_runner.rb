require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

# Set up the game
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
card_4 = Card.new("In what year did the movie Titanic come out?", "1997", :Pop_Culture)
card_5 = Card.new("Who is best known for known for developing the Enigma machine?", "Alan Turing", :STEM)
card_6 = Card.new("What movie won the Academy Award for Best Picture in 2019?", "Parasite", :Pop_Culture)

cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)
round = Round.new(deck)

# Start the game
round.start

# Loop through each card in the deck, accepting a guess and processing the turn
while round.turns.length < round.deck.count
  puts "This card is number #{round.turns.length + 1} of #{round.deck.count}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  round.take_turn(guess)
  puts round.turns.last.feedback
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct}%."

# Get a list of all the categories
categories = []
round.deck.cards.each do |card|
  categories << card.category
end

# remove duplicates, then list out the score from each category
categories = categories.uniq
categories.each do |category|
  puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
end

# QUESTIONS:
# Is the Round class the correct place for start method to live?
# When does it make sense to call a method on round vs. deck, e.g.?
# Should we define new methods in a separate file or is it ok to live in runner?
# How to write a test for something like round.start which just prints (no return)
