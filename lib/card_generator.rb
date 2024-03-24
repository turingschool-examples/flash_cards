require 'io/console'
require './lib/card'

class CardGenerator 
    attr_reader :cards
    def initialize(filename)
        txt_input = IO.binread(filename)
        cards_array = txt_input.split("\n").map {|line| line.split(", ")}
        @cards = cards_array.map {|card| Card.new(card[0], card[1], card[2])}
    end
end