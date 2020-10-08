require './lib/card.rb'

class CardGenerator
  attr_reader :file_string, :cards
  def initialize(filename)
    @file_string = File.open(filename).read
    @cards = extract_cards(@file_string)
  end

  private

  def extract_cards(data)
    cards = []
    lines = data.split("\n")
    lines.each do |line|
      entries = line.split(",")
      cards << Card.new(entries[0],entries[1],entries[2].to_sym)
    end
    cards
  end
end
