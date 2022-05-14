require_relative 'helper'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = './lib/' + filename
    @fileopen = File.open(@filename)
  end

  def cards
    cards = []
    make = File.foreach(@filename) do |line|
      card = line.lines(chomp:true)
      card = card[0].split(',')
      cards << Card.new(card[0], card[1], card[2])
    end
    cards
  end

end
