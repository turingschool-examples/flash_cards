require 'fileutils' # used to interact with file directory

class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    filepath = './data/' + filename # file should live in data directory
    file = File.open(filepath, "r") # r denotes read permissions

    # Algorithm is as follows:
    # for each line in txt file, sanitize and parse line
    # resulting in an array of parsed elements. Parsed elements
    # then are used to create a new instance of a Card, which is
    # then placed in the cards array.
    file.each_line do |line|
      parsed_line = sanitize_input(line)
      new_card = Card.new(parsed_line[0], parsed_line[1], parsed_line[2].to_sym) # note the symbol conversion
      @cards << new_card
    end
    file.close # not sure why you invoke this? Memory?
  end
end

# This method cleans and parses an input string -- designed for a text file
def sanitize_input(string)
  newline_gone = string[0..-2] # there's a \n at the end of every line that needs to be removed
  parsed_array = newline_gone.split(',')
end
