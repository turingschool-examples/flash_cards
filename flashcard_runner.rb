require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)

puts """Welcome! You're playing with #{deck.count} cards.
--------------------------------------------------"""

#continues game until deck out of cards
until round.turns.count >= deck.count do
    puts "This is card number #{round.turns.count + 1} out of #{deck.count} cards."
    puts "Question: #{round.current_card.question}"
    print "Your answer: "
    guess = gets.chomp
    round.take_turn(guess)
    puts round.turns.last.feedback
end

puts """****** Game Over! ******
You had #{round.number_correct} out of #{round.turns.length} for a total score of #{round.percentage_correct}.

"""

# puts round.deck.cards.uniq {|turn_result| turn_result.category}