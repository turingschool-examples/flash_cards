require './lib/card'

class CardGenerator
  attr_accessor :filename, :cards, :new_cards
  
  def build_cards
    file = File.read(filename) 
    raw_cards = file.split(/\n+/)
    raw_cards.reject{ |raw_card| raw_card.start_with?("#") }.each do |raw_card|
      raw_card = raw_card.split(',')
      @new_cards << Card.new(raw_card[0], raw_card[1], raw_card[2].delete(' ').to_sym)
    end
  end

  def initialize(filename)
    @filename = filename
    @new_cards = []
    build_cards
    @cards = @new_cards.shuffle.first(6)
  end
end