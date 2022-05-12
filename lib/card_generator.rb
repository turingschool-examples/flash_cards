require './lib/card'

class CardGenerator

  attr_accessor :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def compiler
    File.open(@filename, "r").each do |line|
    # line = IO.readlines(@filename)[0].strip.split(",")
      new_card_content = line.strip.split(",")
      new_card = Card.new(new_card_content[0], new_card_content[1], new_card_content[2])
      @cards << new_card
    end
  end
end
