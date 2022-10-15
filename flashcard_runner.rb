
require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("Presto, largo, allegro relate to what property of music?" , "Tempo", :Music)
card_5 = Card.new("What is 5 * 5?", "25", :Math)
card_6 = Card.new("What color is Mario's hat?", "Red", "Video Games")
card_7 = Card.new("Who is Master Chief's A.I.?", "Cortana", "Video Games")
deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7])
round = Round.new(deck)
system 'clear'
puts "Welcome! You're playing with #{round.deck.count} cards."
puts '------------------------------------------------------------'

until round.turns.length == round.deck.count
  system 'clear'
  puts "This is card number #{round.turns.length + 1} out of #{round.deck.count}"
  puts "Question: #{round.current_card.question}"
  puts "Type your guess:"

  guess = gets.chomp
  round.take_turn(guess)
  puts round.turn_feedback
  puts '------------------------------------------------------------'
  if round.turns.length  < round.deck.count
    puts 'Hit enter for next'
  else
    puts 'End Game'
  end
  gets.chomp
end


system 'clear'
puts "****** Game Over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct}%."
round.deck.category_groups.each do |category, card|
  puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
end
