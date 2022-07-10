require_relative 'lib/card'
require_relative 'lib/turn'
require_relative 'lib/deck'
require_relative 'lib/round'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

@cards = [@card_1, @card_2, @card_3]

@deck = Deck.new(@cards)
@turn = Turn.new(@guess, @cards[0])
@round = Round.new(@deck)
@turns = []

puts "Welcome! You're playing with #{@deck.cards_in_deck} cards.
-------------------------------------------------
This is card number #{@round.turns.count + 1} out of #{@deck.cards_in_deck}."
puts "Question: #{@round.current_card.question}"

@guess = gets.to_s.chomp
p @turn.correct?
puts "Your answer: #{@guess} is #{@turn.feedback}"