class CardGenerator

  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def collect
    cards = File.open(@filename, 'r') do |file|
      file.readlines.map(&:chomp)
    end
    split = cards.map do |string|
      string.split(",")
    end
    cards = split.map do |card|
      question = card[0]
      answer = card[1]
      category = card[2]
      card = Card.new(question, answer, category)
    end
    @cards = cards
  end



end
