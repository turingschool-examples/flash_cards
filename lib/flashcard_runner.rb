require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
card3 = Card.new("Who is the first officer of the Starship Enterprise D?", "Riker", :Star_Trek_Trivia)
card4 = Card.new("Who is the chief engineer of the Starship Enterprise D?", "La Forge", :Star_Trek_Trivia)
deck = Deck.new([card1, card2, card3, card4])
round = Round.new(deck)

def start(round)

 puts "Welcome to the card game! You're playing with #{round.deck.count} cards!"
 puts "-------------------------------------------------------"

 while (round.turns.size + 1) <= round.deck.count
   puts "This is card number #{round.turns.size + 1} out of #{round.deck.count}."
   puts "Question: #{round.current_card.question}"
   round.take_turn(gets.chomp)
   puts round.turns.last.feedback
 end

puts '****** Game over! ******'
puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct.round}."
# Loop to print percent_correct_by_category for each category present in deck
round.deck.cards.map {|card| card.category }.uniq.each do |category|
  puts "#{category} - #{round.percent_correct_by_category(category).round}%"
  end

end

start(round)
