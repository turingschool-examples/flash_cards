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

# In lieu of a start method, I have abstracted all the actual methods to play the game into ./lib/dialogue.rb

# from dialogue, this takes the number of cards and prints a welcome message
welcome(total_cards)

# again from dialogue, this runs the game by doing one card at a time until there are no cards left to flip over
until cards_left == 0
  puts flip_card(total_cards, cards_left, round).feedback
  cards_left += -1
end

# this simply displays a 'game over' message
game_over()

# this displays the score percentage for each category the player answered from during the round.
display_percentages(round)
