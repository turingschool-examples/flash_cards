require './lib/card'

class CardGenerator
  attr_reader :file_name, :new_cards

  def initialize(file_name)
    @file_name = file_name
    @new_cards = []
  end

  def cards
    File.readlines(@file_name, chomp: true).each do |line|
      card = line.split(', ')
      card = Card.new(card[0], card[1], card[2])
      @new_cards << card #change to new_card
    end
    @new_cards
  end
end

file_name = "cards.txt"

cards = CardGenerator.new(file_name).cards

require 'pry'; binding.pry
