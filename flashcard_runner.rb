require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new("What Olympic sport has competitors throw a sphere as far as possible?", "Shotput", :Sports)
card2 = Card.new("How many animated movies have been nomiated for the Academy Award for Best Picture?", "3", :Movies)
card3 = Card.new("Which Disney movie was the first animated film to be nominated for the Academy Award for Best Picture?", "Beauty and the Beast", :Movies)
card4 = Card.new("What city is the capital of Germany?", "Berlin", :Geography)

cards = [card1, card2, card3, card4]

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
