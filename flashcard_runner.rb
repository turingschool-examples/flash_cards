require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

def start
  card_1 = Card.new("Who is Khoi's favorite superhero?", "Batman", "Khoi")
  card_2 = Card.new("What is Kathy's pet bunny's name?", "Toki", "Kathy")
  card_3 = Card.new("Does Khoi wear glasses?", "Yes", "Khoi")
  card_4 = Card.new("Is Duy the eldest or youngest sibling?", "Youngest", "Duy")
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)

  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------"
end

start