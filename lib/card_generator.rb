#Cannot require a txt file in ruby up here
require 'pry'
require './lib/card.rb'

class CardGenerator

    attr_reader :txt_file, :lines, :cards

  def initialize(txt_file)
    @txt_file = txt_file
    @cards = []
    @lines = File.readlines("./lib/"+txt_file).each do |line|
      #need to pass in path to that file
      card = line.strip.split(",")
      @cards << Card.new(card[0],card[1],card[2])
      puts(line)
    end
  end


  #When I call this method I want it to take an input of the file it needs to read
  #and then give me back an array with each line of that file as an element
  #in the array

end


card_generator = CardGenerator.new("cards.txt")
p card_generator.lines.size

#The goal of this class is to take a txt file and turn it into
#an array of cards called cards with the approirate info in the right spots.
