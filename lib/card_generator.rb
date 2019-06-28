require './lib/card_generator'
require './lib/card'
require 'pry'
#
# cards_txt = File.read("cards.txt").split("\n")
#
# cards_ary = cards_txt.collect {|card| card.split(",")}
#
# deck = cards_ary.collect {|card| Card.new(card[0], card[1], card[2])}

class CardGenerator
attr_reader :file

def initialize(file)
  @file = file
end

def cards_data
  (File.read(@file).split("\n")).collect {|card| card.split(",")}
end

def cards
  cards_data.map {|card| Card.new(card[0], card[1], card[2])}
end

end

#check read_line
