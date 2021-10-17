# require './lib/cards.txt'

class CardGenerator
  attr_accessor :filename #:cards
  def initialize(filename)
    @filename = filename
    # @cards = cards
  end

  def cards(filename)
    # file = File.open(filename)
    file_data = File.new(filename, chomp: true)
    file_data.readlines[0]
    file_data.map {|card| card.split(",")}
    file_data.map {|card| Card.new(card[0], card[1], card[2], card[3])}
    require 'pry'; binding.pry
  end
end
# new_card_gen = CardGenerator.new("lib/cards.txt")
read(filename).chomp.split(",")
