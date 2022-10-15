require './lib/card.rb'

class CardGenerator
  attr_reader :opened_file, :cards, :file_data
  
  def initialize(input)
    @opened_file = File.open(input, "r")
    @cards = []
    @file_data = @opened_file.readlines.map(&:chomp)
  end

  def make_cards
    @file_data.each do |line|
      card_input = line.split(",")
      cards.push(Card.new(card_input[0], card_input[1], card_input[2]))
    end
  end
end