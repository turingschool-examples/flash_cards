require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

cards = CardGenerator.new("./resources/cards.txt")
deck = Deck.new(cards.make_cards)
round = Round.new(deck)

def turn(deck, round)
  puts "\nThis is card number #{round.num_turns_taken + 1} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  new_turn = round.take_turn(guess)
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
  x = 0
  while deck.categories.length != x
    puts "#{deck.categories[x].to_s} - #{round.percent_correct_by_category(deck.categories[x])}% Correct"
    x += 1
  end
end

start(deck, round)

while round.num_turns_taken != deck.count
  turn(deck, round)
end

end_game(deck, round)
