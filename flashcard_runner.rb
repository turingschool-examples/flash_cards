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
  # new_turn = round.take_turn("10")
  # puts "What is your name?"
  # name = gets.chomp
  # puts "#{name}, how many cards would you like to play with?"
  # cards = gets.chomp
  # puts "Welcome! You're playing with #{cards} cards."
  # require "pry"; binding.pry
  # def turn_number
  #   turn_number_count = 0
  #   # round.take_turn == turn_number_count
  #   deck.each do |turn_num|
  #     turn_num.count
  #   end
  # end

# require "pry"; binding.pry
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-------------------------------------------------"

  puts "This is card number #{round.turn_number} out of #{deck.cards.count}."
  puts "Question: What is 5 + 5?"
  guess = gets.chomp
  puts round.take_turn(guess).feedback

  puts "This is card number #{round.turn_number} out of #{deck.cards.count}."
  puts "Question: What is Rachel's favorite animal?"
  guess = gets.chomp
  puts round.take_turn(guess).feedback

  puts "This is card number #{round.turn_number} out of #{deck.cards.count}."
  puts "Question: What is Mike's middle name?"
  guess = gets.chomp
  puts round.take_turn(guess).feedback

  puts "This is card number #{round.turn_number} out of #{deck.cards.count}."
  puts "Question: What cardboard cutout lives at Turing?"
  guess = gets.chomp
  puts round.take_turn(guess).feedback

end

start
