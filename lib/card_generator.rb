class CardGenerator
  attr_reader :cards

  def initialize(filename_parameter)
    file = File.new(filename_parameter, "r")

    card_values = file.read.split("\n")
    @cards = card_values.map do |card_value|
      line = card_value.split(",")
      question = line[0]
      answer = line[1]
      category = line[2].to_sym
      Card.new(question, answer, category)
    end
  end
end
