class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    parse_information(filename)
  end

  def parse_information(filename)
    if(File.file?(filename))
      file = File.open(filename)
      card_info = file.readlines.map(&:chomp)
    else
      card_info = filename.split("\n")
    end
    card_info.each do | line |
      card = line.split(',')
      @cards << Card.new(card[0], card[1], card[2])
    end
  end
end
