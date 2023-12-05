require_relative './lib/card'      
require_relative './lib/deck'
require_relative './lib/turn'
require_relative './lib/round'
require_relative './runner.rb'
#question:  What's the diff b/n require and require_relative? I read about the difference but functionally it seems to do the same thing.

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is the best food on the planet?", "Ice cream", :Essential)
cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)

round = Round.new(deck)

round.start




# use puts ("put string")to display a line of text output to the user
# "puts and gets both deal only with strings"
# Use gets to read a line of text input from the user
  # gets ("get string")creates a new line and asks the user to input something. 
  # gets.chomp does the same thing without creating a new line. 