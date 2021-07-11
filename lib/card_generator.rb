require './lib/card'

class CardGenerator
  attr_reader :filename,
              :cards

  def initialize(filename)
    @filename = filename
  end

  def cards
    file = File.open(filename)
    data = file.readlines.map(&:chomp)

    data.map do |card|
      card_input = card.split(',')
      Card.new(card_input[0], card_input[1], card_input[2].to_sym)
    end
  end
end
