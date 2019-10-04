require 'csv'
require './lib/card'

class CardGenerator

  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def extract_csv
    CSV.foreach(@filename) do |row|
      new_card = Card.new(row[0], row[1], row[2].to_sym)
      @cards << new_card
    end
  end

end
