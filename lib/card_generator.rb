require './lib/card'

require './lib/turn'

require './lib/deck'

require './lib/round'

class CardGenerator
  attr_reader :filename, :card_data, :cards_inputted
  def initialize(filename)
    @filename = File.open(filename)
    @card_data = @filename.readlines.map(&:chomp)
    @cards_inputted = []
    @card_data.each do |card|
      card_input = card.split(',')
      @cards_inputted << Card.new(card_input[0], card_input[1], card_input[2])
    end
  end
end