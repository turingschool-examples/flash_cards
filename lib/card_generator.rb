
class CardGenerator
  attr_reader :filename, :file_data, :read_cards_file

  def initialize(filename)
    @filename = filename
    @file_data = read_cards_file(filename)
  end

  def read_cards_file(filename)
    File.open(filename, 'r') do |f|
      f.readlines.map(&:chomp)
    end
  end

  def edit_cards_text
    @file_data.map do |item|
      item.split(",")
    end
  end

  def cards
    edit_cards_text.map do |item|
      Card.new(item[0], item[1], item[2])
    end
  end

  end
