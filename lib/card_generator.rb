require './lib/card'

# Documentation for class CardGenerator
class CardGenerator
  attr_reader :cards, :file_text

  def initialize(file_path)
    @cards = []
    @file_text = ''
    @file_path = file_path
  end

  def parse_file
    file = File.open(@file_path)
    @file_text += file.read
  end

  def push_cards
    text_array = @file_text.split("\n")
    text_array.each do |card_text|
      params_array = card_text.split(',')
      question = params_array[0]
      answer = params_array[1]
      category = params_array[2].to_sym
      card = Card.new(question, answer, category)
      @cards.push(card)
    end
  end
end
