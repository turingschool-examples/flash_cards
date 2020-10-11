require "./lib/card"

class CardGenerator
  attr_reader :filename, :cards, :raw_data

  def initialize(filename)
    @filename = filename
    @cards = []
    @raw_data = []
    open_file(@filename)
  end

  def open_file(file_path)
    file = File.open(file_path)
    @raw_data = file.read.split("\n")
    create_cards(@raw_data)
  end

  def create_cards(text_arr)
    @cards << text_arr.map do |card_text|
      split_card_text = card_text.split(",")
      Card.new(*split_card_text)
    end

    @cards = @cards.flatten
  end
end