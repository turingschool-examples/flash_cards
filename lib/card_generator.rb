require_relative 'card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    imported_cards = []

    File.open(@filename).each do |line|
      card_elements = line.chomp.split(",")
      card = Card.new(card_elements[0], card_elements[1], card_elements[2])
      imported_cards << card
    end
    imported_cards
  end
end
