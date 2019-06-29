require './lib/card'

class CardGenerator
  attr_reader :file, :cards

  def initialize(file)
    @file = file
    @cards = []
  end

  def cards
    data = File.new(@file).read
    data = data.split("\n")
    data.each do |element|
      card_data = []
      card_data << element.split(",")
      cleaned_card_data = card_data.flatten
      question = cleaned_card_data[0]
      answer = cleaned_card_data[1]
      category = cleaned_card_data[2]
      @cards << Card.new(question, answer, category)
    end
    @cards
  end
end
