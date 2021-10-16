require './lib/card'

# Card generator definition. Is designed to take a text file and upon calling #cards will return a formated array of Card objects to be used for playing flash card game.

# NOTE: text files must be inputted in the correct format.
# Each line of text is considered a trivia card to be imported. 
# Each line must include a question string, an answer string, and a category string. No need for single or double quotes unless it is a part of the question.
# Each item must be separated with a comma between items. No extra spaces.

# Example trivia lines: 
# What is 2 + 2?,4,Math
# What is the captial of Colorado?,Denver,Geography
# Where did the character Indiana Jones get his name 'Indiana' from?,His dog,Movie

class CardGenerator
  attr_accessor :filename
  
  # Set the filename that will be used to generate the cards for trivia.
  def initialize(filename)
    @filename = filename
  end

  # Converts the text file to card objects and returns them in an array.
  def cards
    # Read the text file by line removing newline characters. Each line is an element in the card_data array.
    card_data = IO.readlines(@filename, chomp: true)

    # Split each element by comma. The comma delineates all attributes of each Card attribute. This makes it so each Card object attributes is an array, with each element being a different attribute.
    # Card = [:question, :answer, :category]
    card_data.map! { |card| card.split(',') }

    # Take each Card element and set each element into a new Card object to return.
    card_data.map { |card| Card.new(card[0], card[1], card[2].to_sym) }
  end
end
