

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

#card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#card_4 = Card.new("What does the country Italy look like on a map?", "A boot", :Geography)
#cards = [card_1, card_2, card_3, card_4]
cards = CardGenerator.new("cards.txt").cards


deck = Deck.new(cards)

round = Round.new(deck)

round.start

i = 1
while i <= round.deck.count
  puts "This is card number #{i} out of #{round.deck.count}."
  puts round.current_card.question
  guess = gets.chomp
  next_turn = round.take_turn(guess)
  puts next_turn.feedback
  i += 1
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct.to_i}%."

used_categories = []

round.turns.each do |turn|
  if used_categories.include?(turn.card.category)
    next
  else
    puts "#{turn.card.category} - #{round.percent_correct_by_category(turn.card.category).to_i}% correct"
  end
  used_categories << turn.card.category
end
