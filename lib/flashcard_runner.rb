require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new(
  "What is the fastest living creature",
  "Mantis shrimp",
  :Zoology)

card_2 = Card.new(
  "What species is the oldest known tree",
  "Bristlecone pine",
  :Botany)

card_3 = Card.new(
  "What is an organism that consists of a symbiotic relationship between a fungus and alga",
  "Lichen",
  :Mycology)

card_3 = Card.new(
  "What is an organism that consists of a symbiotic relationship between a fungus and alga",
  "Lichen",
  :Mycology)

card_4 = Card.new(
  "What is the largest living organism?",
  "Aspen",
  :Botany)


deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards"
puts "_______________________________________________________"

round.start












#
