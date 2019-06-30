require 'csv'
require './lib/card'
# require 'pry'

class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def generate
    arr_of_arrs = CSV.read(@filename)
    cards = arr_of_arrs.map {|row| p Card.new(row[0], row[1], row[2]) }
    cards
  end

end
