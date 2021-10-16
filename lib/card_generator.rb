# card_file = File.open('cards.txt', "r")
# cards_array = card_file.readlines
# cards_array_without_newline = cards_array.map {|card| card.chomp }
# ===> cards = cards_without_newline.map {|card| card = Card.new([0])}
# card_file.close

class CardGenerator
  attr_reader :cards
  def initialize(text_file)
    @filename = File.open(text_file) #,'r'))
    @cards = []
  end

  def read_file
    @filename.read
  end

  def separate_card_data
    read_file.split("\n")
  end

  def make_strings
    separate_card_data.map do |card|
      card.split(",")
    end
  end

  def make_cards
    make_strings.map do |string|
      @cards << Card.new(string[0], string[1], string[2].to_sym)
    end
  end

end

#   # def close_file
#   #   @card_file.close
#   # end
