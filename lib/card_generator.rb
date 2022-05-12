class CardGenerator
  #require './cards.txt'
  attr_reader :cards
  def initialize(filename)
    @filename = filename
    @cards = []
    @card_data = File.readlines(File.join(__dir__, filename))
    @card_data.each do |line|
       @card_input = line.split(",")
       @cards << Card.new(card_input[0].chomp,card_input[1].chomp,card_input[2].chomp)
     end
  end

  def make_cards

  end
end
