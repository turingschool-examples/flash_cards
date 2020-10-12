require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


def start

  card_1 = Card.new("Question: What is 5 + 5", "10", :maths)
  card_2 = Card.new("Question: What is Rachel's favorite animal?", "dolphin", :animals)
  card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", :middle_names)
  card_4 = Card.new("Question: What cardboard cutout lives at Turing?", "Justin Bieber", :cutouts)
  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)
  
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-------------------------------------------------"

  puts "This is card number #{round.turn_number} out of #{deck.count}."
  puts "Question: What is 5 + 5?"
  guess = gets.chomp
  puts round.take_turn(guess).feedback

  puts "This is card number #{round.turn_number} out of #{deck.count}."
  puts "Question: What is Rachel's favorite animal?"
  guess = gets.chomp
  puts round.take_turn(guess).feedback

  puts "This is card number #{round.turn_number} out of #{deck.count}."
  puts "Question: What is Mike's middle name?"
  guess = gets.chomp
  puts round.take_turn(guess).feedback

  puts "This is card number #{round.turn_number} out of #{deck.count}."
  puts "Question: What cardboard cutout lives at Turing?"
  guess = gets.chomp
  puts round.take_turn(guess).feedback

end

start
