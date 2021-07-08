require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is 5 + 5", "10", :STEM)
card_2 = Card.new("Who voices Shrek?", "Mike Myers", :Pop_Culture)
card_3 = Card.new("What is the capital of the USA?", "Washington D.C.", :Geography)
card_4 = Card.new("What is 2 - 8", "-6", :STEM)

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)
round = Round.new(deck)

def turn(deck, round)
  puts "\nThis is card number #{round.num_turns_taken + 1} out of #{deck.cards.length}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  round.take_turn(guess)
  puts "#{round.turns.last.feedback}"
end

def start(deck, round)
  puts "Welcome! You're playing with #{deck.cards.length} cards."
  35.times{|i| print "-"}
  turn(deck, round)
end

def end_game(deck, round)
  puts "****** GAME OVER ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.num_turns_taken} for a total score of #{round.percent_correct}%"
  puts "STEM - #{(round.number_correct_by_category(:STEM).length.to_f / deck.cards_in_category(:STEM).length.to_f) * 100}%"
  puts "Geography - #{(round.number_correct_by_category(:Geography).length.to_f / deck.cards_in_category(:Geography).length.to_f) * 100}%"
  puts "Pop Culture - #{(round.number_correct_by_category(:Pop_Culture).length.to_f / deck.cards_in_category(:Pop_Culture).length.to_f) * 100}%"
end


start(deck, round)

while round.num_turns_taken != deck.cards.length
  turn(deck, round)
end

end_game(deck, round)
