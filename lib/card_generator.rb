class CardGenerator
  attr_reader :file

  # require 'pry'; binding.pry

  def initialize(filename)
    @file = File.open(filename)
  end

  def cards
    card_set = []
    cards_as_array = @file.read.split("\n")
    cards_as_array.each do |card_in_array|
      card_info = card_in_array.split(",")
      card = Card.new(card_info[0], card_info[1], card_info[2])
      card_set << card
    end
    return card_set
  end

end
