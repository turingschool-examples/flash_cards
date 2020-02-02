class CardGenerator
  attr_reader :cards

  def initialize(filename_parameter)
    file = File.new(filename_parameter, "r")

    cards = []
    text = file.read
    array_of_text = text.split("\n")
    line1 = array_of_text[0].split(",")
    line2 = array_of_text[1].split(",")
    require "pry"; binding.pry


    card = line.split(",")
    question = card[0]
    answer = card[1]
    category = card[2].delete("\n").to_sym
    Card.new

  end

end
