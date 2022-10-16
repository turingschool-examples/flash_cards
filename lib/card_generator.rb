class CardGenerator
  attr_reader :text

  def initialize(filename)
    @text = File.read(filename)
  end

  def cards
    deck = []
    text.each_line do |card|
      deck << Card.new(card.chomp.split(',')[0], card.chomp.split(',')[1], card.chomp.split(',')[2])
    end
    deck
  end
end
