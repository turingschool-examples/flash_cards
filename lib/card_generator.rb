class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    cards_array = []
    read_file = File.read(@filename).split("\n")
    
    read_file.each do |line|
      card = line.split(",")
      cards_array << Card.new(card[0], card[1], card[2])
    end
    cards_array
  end
end