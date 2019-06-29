require './lib/card_generator'
require './lib/card'
require 'pry'

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
