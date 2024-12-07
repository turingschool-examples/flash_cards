class Turn #creates a Turn class
  attr_reader :string, :card
  #makes the attributes string and card readable to the user
  def initialize(string, card) #initialize the class with parameters of string and card
    @string = string #set the string to the string parameter
    @card = card #set the card to the card parameter
  end

  def card #creates a method called card
    @card #returns the card
  end

  def guess #creates a method called guess
    @string #returns the string entered by the user
  end

  def correct? #creates a method called correct?
    @string.downcase == @card.answer.downcase #returns true if the string entered by the user is equal to the answer of the card
    #? makes the method return a boolean value
    #.downcase makes the string entered by the user and the answer of the card lowercase
    #== compares the string entered by the user and the answer of the card
    #.answer accesses the answer attribute of the card
    #.downcase makes the answer of the card lowercase
  end

  def feedback #creates a method called feedback
    correct? ? "Correct!" : "Incorrect." #returns "Correct!" if the string entered by the user is equal to the answer of the card
    #? makes the method return a boolean value
    #: ? ? makes the method return a boolean value and represents an if/else statement
    # : is used to separate the if/else statement
  end
end

#[:STEM] placed in the code to help identify the different parts of the code
# for example after creating and instance and adding a string and card
# the code would look like this:    @turn = Turn.new("Juneau", @card) #[:STEM]
# the purpose of this is to help identify the different parts of the code

