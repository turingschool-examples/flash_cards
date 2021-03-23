require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/card_generator'

puts "Welcome! You're playing with 4 cards."
puts "-------------------------------------------------"

cards = [
  Card.new("What data structure does a Linked List implement?", "Graph", :STEM),
  Card.new("Where are values stored?", "Variables", :STEM),
  Card.new("What is an orogeny?", "Mountain Building Event", :Geology),
  Card.new("What is molten rock called before it erupts to the surface?", "Magma", :Geology),
  Card.new("What is the most common mineral on earth's surface?", "Quartz", :Geology)
]

categories = [:STEM, :Geology]

deck = Deck.new(cards)
round = Round.new(deck)

card_number = 1

until card_number > deck.count
  puts "This is card number #{card_number} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  answer = gets.chomp

  turn = round.take_turn(answer)
  puts turn.feedback
  card_number = card_number + 1
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}%."

categories.each {|category|
  print "#{category} -  %0.1f" % round.percent_correct_by_category(category)
  puts "%"
}
