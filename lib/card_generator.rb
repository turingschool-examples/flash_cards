require './lib/card'

class CardGenerator
  attr_reader :filename
  attr_accessor :cards

  # initialize card generator with basic variables
  def initialize(filename)
    @filename = filename
    @cards = generate_cards
  end

  # open the file and generate cards from the text values
  # return the final array of cards
  def generate_cards
    # no need to assign or return @cards here.
    # switching from .each to .map implictly returns the updated array
    # call the generate_cards during initialize to assign to instance variable
    File.open(@filename).map do |line|
      question = line.split(',')[0]
      answer = line.split(',')[1]
      category = line.split(',')[2].delete("\n")
      card = Card.new(question, answer, category)
    end
  end
end
