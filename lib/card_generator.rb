class CardGenerator
  attr_reader :cards

  def initialize(filename_parameter)
    file = File.new(filename_parameter, "r")

    card_values = file.read.split("\n")
    @cards = card_values.map do |card_value|
      line = card_value.split(",")
      Card.new(line[0], line[1], line[2].to_sym)
    end
  end
end
