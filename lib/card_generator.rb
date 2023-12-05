require "./lib/card"

class CardGenerator
  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def card_data
    File.readlines(@filename, chomp: true)
  end

  def cards
    card_data.map do |data|
      question, answer, category = data.split(",")
      Card.new(question, answer, category)
    end
  end
end
