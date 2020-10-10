require './lib/card'
require './lib/turn'
require './lib/deck'
require "./lib/round"
require './lib/dialogue'
require './lib/card_generator'

cards = CardGenerator.new("cards.txt").cards
deck = Deck.new(cards)
round = Round.new(deck)

total_cards = deck.count
cards_left = total_cards

# again from intro, this takes the number of cards and prints a welcome message
welcome(total_cards)

until cards_left == 0
  puts flip_card(total_cards, cards_left, round).feedback
  cards_left += -1
end

game_over()

display_percentages(round)
