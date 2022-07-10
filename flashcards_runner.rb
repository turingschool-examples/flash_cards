require_relative 'lib/card'
require_relative 'lib/turn'
require_relative 'lib/deck'
require_relative 'lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is 5+5", "10", :STEM)
card_5 = Card.new("What is  5/2?", "2.5", :STEM)
card_6 = Card.new("Who is the best pop singer?", "Lady gaga, duh", "Pop Culture")

cards = [card_1, card_2, card_3, card_4, card_5, card_6]

deck = Deck.new(cards)

round = Round.new(deck)

turns = []

cat_arry = []

puts ""
puts "Welcome! You're playing with #{deck.cards_in_deck} cards.
-------------------------------------------------"

cards.count.times do


    "This is card number #{round.turns.count + 1} out of #{deck.cards_in_deck}."
    puts "Question: #{round.current_card.question}"

    input = gets.chomp
    
    input.to_s
    guess = input.capitalize

    turn = Turn.new(guess, cards[0])
    round.current_card.answer.to_s
    puts "The answer is #{round.current_card.answer}. Your guess #{guess} is #{turn.feedback}"

    turns << round.take_turn(guess)

end
puts ""
puts "****** Game over! ******"
puts ""
puts "You had #{round.number_correct} correct guesses out of #{cards.count} for a total score of #{round.percent_correct}%"


turns.each do |turn|
    cat_arry << turn.card.category unless cat_arry.include?(turn.card.category)
end

cat_arry.each do |cat|
    puts "#{cat} - #{round.percent_correct_by_category(cat)}%"
end



