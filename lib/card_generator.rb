#~/card_generator.rb
require 'pry'
class CardGenerator
  def initialize(filename)
    @filename = File.open(filename)
  end

  def cards
    file_data = File.read(@filename).split("\n")
    cards_ary = []
    file_data.each do |line|
      split_line = line.split(",")
      new_card = Card.new(split_line[0], split_line[1], split_line[2])
      cards_ary << new_card
    end
    cards_ary
  end
end
