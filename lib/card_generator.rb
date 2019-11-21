# require './data/cards.txt'
require './lib/card'

class CardGenerator
  attr_reader :cards

  def initialize(txt_file)
    @cards = generate_cards(txt_file)
  end

  def generate_cards(txt_file)
    card_array = []
    File.open(txt_file).each do |line|
      line_array = line.strip.split(',')
      card = Card.new(line_array[0], line_array[1], line_array[2])
      card_array.push(card)
    end
    card_array
  end

end
