require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697 .5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is JLO short for?", "Jennifer Lopez", :Pop_culture)


cards = [card_1, card_2, card_3, card_4]

@deck = Deck.new(cards)

@round = Round.new(@deck)

def start

  p "Welcome! You're playing with #{@deck.cards.count} cards."
  p "-------------------------------------------------"

  i = 0
  while i < @deck.cards.count - 1



# p "This is card number #{deck.cards.first} out of #{cards.count}."
# p "Question: #{cards.question}?"

  i += 1
  p i
  end

end

start
