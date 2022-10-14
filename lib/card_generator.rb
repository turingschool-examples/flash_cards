require './lib/card'

require './lib/turn'

require './lib/deck'

require './lib/round'

class CardGenerator
  attr_reader :filename, :card_data, :cards
  def initialize(filename)
    @filename = File.open(filename)
    
    @card_data = @filename.readlines.map(&:chomp)

    @cards = []

    @card_data.each do |card|
      @cards << Card.new(card.split ',')
    end
      

  end
end