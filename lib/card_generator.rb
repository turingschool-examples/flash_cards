require './lib/card'

class CardGenerator
  attr_reader :filename
  attr_accessor :cards

  # initialize card generator with basic variables
  def initialize(filename)
    @filename = filename
    @cards = []
  end

  # open the file and generate cards from the text values
  # return the final array of cards
  def cards
    File.open(@filename).each do |line|
      question = line.split(',')[0]
      answer = line.split(',')[1]
      category = line.split(',')[2].delete("\n")
      card = Card.new(question, answer, category)
      @cards << card
    end
    @cards
  end
end
