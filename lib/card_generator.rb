class CardGenerator
  attr_accessor :uploaded_cards

  def initialize
    @uploaded_cards = Array.new
  end

  def generate(filename)
    File.open(filename).each do |line|
      card_attributes = line.split(",")
      @uploaded_cards << Card.new(card_attributes[0], card_attributes[1], card_attributes[2])
    end
    @uploaded_cards
  end
end
