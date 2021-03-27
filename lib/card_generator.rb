require './lib/card'

class CardGenerator
  attr_reader :filename,
              :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def generate_cards
    file = File.open(@filename)
    file_data = file.readlines.map(&:chomp)
  end

  def split_generated_cards
    split = generate_cards.map do |element|
      element.split(",")
    end
  end

  def cards
    split_generated_cards.map do |card|
      question = card[0]
      answer = card[1]
      category = card[2]
      Card.new(question, answer, category)
    end
  end
end
