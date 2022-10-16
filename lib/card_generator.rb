class CardGenerator
  attr_reader :text

  def initialize(filename)
    @text = File.read(filename)
  end

  def cards
    deck = []
    text.each_line do |card|
      info = card.chomp.split(',')
      deck << Card.new(info[0], info[1], info[2])
    end
    deck
  end
end
