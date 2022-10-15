require './lib/card'

class CardGenerator
  attr_accessor :filename, :cards
  
  def build_cards
    file = File.read(filename) 
    raw_cards = file.split(/\n+/)
    raw_cards.each do |raw_card|
      raw_card = raw_card.split(',')
      @cards << Card.new(raw_card[0], raw_card[1], raw_card[2].delete(' ').to_sym)
    end
  end

  def initialize(filename)
    @filename = filename
    @cards = []

    build_cards
  end
end