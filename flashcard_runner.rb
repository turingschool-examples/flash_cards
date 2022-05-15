require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("What is the 5th planet from the sun?", "Jupiter", :STEM)
card_4 = Card.new("What is the capital of Arizona?", "Phoenix", :Geography)
card_5 = Card.new("Which artist has the most number one hits of all time?", "The Beatles", :Music)
card_6 = Card.new("What is the highest grossing movie of all time?", "Avatar", :Movies)
card_7 = Card.new("What is the element with symbol Au?", "Gold", :STEM)
card_8 = Card.new("What is the top selling video game of all time?", "Minecraft", :Games)
deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8])
round = Round.new(deck)

round.start

puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.round(0)}%."
categories = round.turns_by_category
categories.each do |category|
puts "#{category} - #{round.percent_correct_by_category(category)} correct"
end
