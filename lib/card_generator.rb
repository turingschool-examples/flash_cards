require './lib/card'

class CardGenerator
  attr_reader :cards
  def initialize(file)
    @cards = []
    @file = File.open(file).read
    @generate_cards = generate_cards
  end

  def generate_cards
    card_info = @file.split("\n")
    card_info.each do |info|
      @cards << Card.new(info.split(',')[0], info.split(',')[1], info.split(',')[2].to_sym)
    end
  end
end