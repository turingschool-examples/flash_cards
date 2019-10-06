class CardGenerator
  attr_accessor :uploaded_cards

  def initialize
    @uploaded_cards = Array.new
  end

  def generate(filename)
    File.open(filename).each do |line|
      split_line = line.split(",")
      @uploaded_cards << Card.new(split_line[0], split_line[1], split_line[2])
    end
    @uploaded_cards
  end
end
