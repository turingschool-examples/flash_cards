class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = File.read(filename)
  end

  def generate_cards
    table_1 = @filename.split("\n")
    table_2 = table_1.map do |i|
      i.split(',')
    end
    table_2.map do |card|
      Card.new(card[0], card[1], card[2])
    end
  end
end
