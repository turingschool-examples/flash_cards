require './lib/card'
require 'pry'

class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @filename = filename
    @cards = create_cards
  end

  def create_cards
    lines_split = []

    File.open(@filename).each do |line|
      lines_split.push(line.split(','))
    end

    new_cards = []
    lines_split.each do |line|
      new_cards << Card.new(line[0], line[1], line[2].chomp.to_sym)
    end
    new_cards
  end
end
