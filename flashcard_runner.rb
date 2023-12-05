require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"
require "./lib/card_generator"

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# cards = [card_1, card_2, card_3]
# deck = Deck.new(cards)
# round = Round.new(deck)

cards = CardGenerator.new("cards.txt").cards
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards.\n#{"-" * 45}"

#continues game until deck out of cards
until round.turns.count >= deck.count do
    puts "This is card number #{round.turns.count + 1} out of #{deck.count} cards."
    puts "\tQuestion: #{round.current_card.question}"
    print "\tYour answer: "
    guess = gets.strip
    round.take_turn(guess)
    puts "\t#{round.turns.last.feedback}\v"
end

puts """****** Game Over! ******
You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percentage_correct}%."""

every_turns_category = round.turns.map {|card_info| card_info.card.category}
category_list = every_turns_category.uniq!
category_list.each do |category_name| 
    puts "\t#{category_name} \- #{round.percent_correct_by_category(category_name)}% correct (#{round.number_correct_by_category(category_name)}\/#{deck.cards_in_category(category_name).count} cards)"
end