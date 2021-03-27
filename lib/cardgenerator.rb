require 'fileutils' # used to interact with file directory

class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    filepath = './data/' + filename # file should live in data directory
    file = File.open(filepath, "r") # r denotes read permissions

    # Algorithm is as follows:
    # for each line in txt file, parse line by comma placement,
    # resulting in an array of parsed elements. Parsed elements
    # then are used to create a new instance of a Card, which is
    # then placed in the cards array.
    file.each_line do |line|
      parsed = line.split(',') # parsed should be an array
      new_card = Card.new(parsed[0], parsed[1], parsed[3])
      @cards << new_card
    end
    file.close # not sure why you invoke this? Memory?
  end
end
