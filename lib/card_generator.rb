require './lib/card'

class CardGenerator

  attr_reader :filename
  attr_accessor :cards

  def initialize(filename)
    @filename = filename
    @cards = []

    File.open(@filename, "r").each do |line|
      new_card_content = line.strip.split(",")
      new_card = Card.new(new_card_content[0], new_card_content[1], new_card_content[2])
      @cards << new_card
    end
  end
end
