require './lib/card.rb'

class CardGenerator
  attr_reader :file, :cards

  def initialize(file)
    @file = File.open(file)
    @cards = []
    @file_data = @file.readlines.map(&:chomp)
  end

  def make_cards
    @file_data.each do |line|
      input = line.split(",")
      cards.push(Card.new(input[0], input[1], input[2]))
    end
    
  end


end