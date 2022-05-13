class CardGenerator
  attr_reader :cards
  def initialize(filename)
    @filename = filename
    @cards = []
    card_input = []
    card_data = File.readlines(File.join(__dir__, filename))
    card_data.each do |line|
       card_input = line.split(",")
       @cards << Card.new(card_input[0],card_input[1],card_input[2].chomp)
     end
  end
end
