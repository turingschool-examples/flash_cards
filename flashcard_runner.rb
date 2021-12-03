require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'



def start
  card_1 = Card.new("Question: 1 + 1 = ?", 2, :Math)
  card_2 = Card.new("Question: 1 + 2 = ?", 3, :Math)
  card_3 = Card.new("Question: What food do I like to eat now?", "Humus", :Food)
  card_4 = Card.new("Question: What other food do I like to eat now?", "Grapes", :Food)
  cards = [card_1, card_2, card_3, card_4]

  deck = Deck.new(cards)
  round = Round.new(deck)
  puts "Welcome! You're playing with 4 cards."
  50.times {print "-"}
  puts "\nThis is card number #{cards.index(card_1) + 1} out of #{cards.size} "
  puts card_1.question
end

start
