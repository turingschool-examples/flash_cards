require 'pry'
require './lib/card'


class Turn #creates a Turn class
  attr_reader :guess, :card
  #makes the attributes guess and card readable to the user
  def initialize(guess, card) #initialize the class with parameters of guess and card
    @guess = guess #set the guess to the guess parameter
    @card = card #set the card to the card parameter
  end

  def correct? #creates a method called correct?
    @guess == @card.answer #returns true if the guess entered by the user is equal to the answer of the card
    #? makes the method return a boolean value
    #== compares the guess entered by the user and the answer of the card
    #.answer accesses the answer attribute of the card
  end

  def feedback #creates a method called feedback
    correct? ? "Correct!" : "Incorrect." #returns "Correct!" if the guess entered by the user is equal to the answer of the card
    #? makes the method return a boolean value
    #: ? ? makes the method return a boolean value and represents an if/else statement
    # : is used to separate the if/else statement
  end
end

#[:STEM] placed in the code to help identify the different parts of the code
# for example after creating and instance and adding a guess and card
# the code would look like this:    @turn = Turn.new("Juneau", @card) #[:STEM]
# the purpose of this is to help identify the different parts of the code

