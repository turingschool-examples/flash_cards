require_relative './card.rb'
require_relative './deck.rb'

class CardGenerator
  attr_reader :generated_cards
  
  def initialize(filename)
    @filename = filename
  end

  def cards
    cards_from_filename = []
    generated_cards = []
    File.open(@filename).each do |line|
      cards_from_filename << line.chomp.split(',')
    end
    cards_from_filename.each do |card|
      generated_cards << Card.new(card[0],card[1],card[2])
    end
    generated_cards
  end
end
