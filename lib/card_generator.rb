require './lib/card'

class CardGenerator
  attr_reader :filename, :cards_from_file

  def initialize(filename)
    @filename = filename
    @cards_from_file = []
  end

  def generate_cards
    File.foreach(@filename) do |line|
      card = line.split(',').map(&:strip)
      @cards_from_file << Card.new(card[0], card[1], card[2].gsub(" ", "_").to_sym)
    end
  end
end

