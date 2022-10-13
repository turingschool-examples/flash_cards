require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capitol of Mongolia?", "Ulaanbaatar", :Geography)
card_2 = Card.new("What is the common name of Acetylsalicylic acid?", "Aspirin", :STEM)
card_3 = Card.new("What is the square root of 81?", "9", :STEM)
card_4 = Card.new("What is the rarest blood type?", "AB-", :STEM)
card_5 = Card.new("Who played Jack in the movie 'Titanic'?", "Leonardo DiCaprio", :PopCulture)
card_6 = Card.new("What amazing soccer team is based in Seattle, Washington?", "Sounders FC", :Sports)

deck_1 = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])

round = Round.new(deck_1)

p "Welcome! You're playing with #{round.deck.count} cards."
p "-------------------------------------------------------"

while round.deck.count > 0 do

p "This is card number #{(round.turns.length) + 1} out of #{round.deck.count + round.turns.count}."
p "Question: #{round.current_card.question}"

answer_1 = gets.chomp

round.take_turn(answer_1)

p round.turns[-1].feedback
end