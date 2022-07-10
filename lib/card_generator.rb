require './lib/card'
require './lib/cards.txt'

class CardGenerator
  attr_reader :filename

  def initialize (filename)
    @filename = filename
  end

  def cards
    filename.open#Access file cards.txt
    #Read the line for 1 card
    #Identify correct arguments (question, answer, category)
    #Make the card
    #Put into a final array
    #Repeat for each card
    #Output the final array
  end

end
