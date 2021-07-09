require './lib/card'
class CardGenerator

  attr_reader :file
  def initialize(file)
    @file = File.new(file)
  end

  def convert_to_array
    string_cards = @file.readlines
    string_cards.map do |string|
      string.chomp
    end
  end

  def split_string(array)
    array.map do |string|
      string.split(',')
    end
  end

  def make_cards(array)
    array.map do |card|
      category = card[2]
      if category.include?(' ')
        category = category.gsub(' ', '_')
      end
      Card.new(card[0], card[1], category.to_sym)
    end
  end

  def cards
    make_cards(split_string(convert_to_array))
  end
end
