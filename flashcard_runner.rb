require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
@cards = [@card_1, @card_2, @card_3]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

  p "Welcome! You're playing with #{@deck.cards.count} cards."
  p "--------------------------------------------------------------------"
  @deck.cards.each_with_index do |card, index|
  p "This is card number #{index + 1} out of #{@deck.cards.count}."
  p "Question: #{card.question}?"
  @answer = gets.chomp
  new_turn = @round.take_turn(@answer)
  p new_turn.feedback
end
