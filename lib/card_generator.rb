require_relative './helper'

class CardGenerator
  attr_reader :file, :cards

  def initialize(file)
    @file = './lib/' + file
    @fileopen = File.open(@file)
    @fileread = File.read(@file)
    @cards = []
  end

  def cards
    cards = []
    make = File.foreach(@file) do |line|
      card = line.lines(chomp:true)
      card = card[0].split(',')
      cards << Card.new(card[0], card[1], card[2])
    end
    @cards = cards
  end

end
