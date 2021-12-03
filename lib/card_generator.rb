require './lib/card'

class CardGenerator
  attr_accessor :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
    @file = File.open("lib/#{filename}", "r") #opens file
    @file.map do |line| #iterates through each line
      line.chomp! # removes \n which were spaces in .txt file
      line = line.split(',') #reverts to array by element
      @cards << Card.new(line[0], line[1], line[2]) #assign elements to card attr
    end
  end
end
