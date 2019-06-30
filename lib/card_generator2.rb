require 'csv'
require './lib/card'
require 'pry'

class ClassGenerator

  arr_of_arrs = CSV.read("lib/cards.txt")
  cards = arr_of_arrs.each {|row| p Card.new(row[0], row[1], row[2]) }
  cards

end
