require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


# Inside of this file, write the code to do the following:
# 
# Create some Cards
# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start
# Keep in mind that your existing objects should already contain, more or less, the data and methods needed to manage this process. Your challenge in this iteration is to build out the input/output messaging to support the user’s card experience using your existing pieces to store and manage all the necessary data.
# 
# When we start the round by running ruby flashcard_runner.rb, it should produce the following interaction from the command line:
# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# 
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# 
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# 
# cards = [card_1, card_2, card_3]
# deck = Deck.new(cards)
# 
# puts to display a line of text to user
# gets to read a line of input from a user