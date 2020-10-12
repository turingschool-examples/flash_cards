require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


def start

  card_1 = Card.new("Question: What is 5 + 5", "10", :maths)
  card_2 = Card.new("What is Rachel's favorite animal?", "panda", :animals)
  card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", :middle_names)
  card_4 = Card.new("Question: What cardboard cutout lives at Turing?", "Justin Bieber", :cutouts)
  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)
  # puts "What is your name?"
  # name = gets.chomp
  # puts "#{name}, how many cards would you like to play with?"
  # cards = gets.chomp
  # puts "Welcome! You're playing with #{cards} cards."
  # require "pry"; binding.pry

  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-------------------------------------------------"

  puts "This is card number #{deck.cards.count} out of #{round.deck.count}."
  puts "Question: What is 5 + 5?"
  #
  # gets.chomp


  #create cards
  #put those cards in a deck
  #make new Round using the created deck


  # puts "This is card number #{cards[0]} out of #{cards.count}"
  # puts "Question: What is #{5} + #{5}?"
  #
end

start
