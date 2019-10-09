class CardGenerator
  require 'pry'
  attr_reader :filename, :lines, :review_file
  def initialize(filename)
    @filename = filename
    @review_file
  end
  def open_file

    end
  end

end

require './lib/card_generator'
@card_generator = CardGenerator.new("cards.txt")
@card_generator.open_file
