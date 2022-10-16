# class CardGenerator
#   attr_reader :filename
#   def initialize(filename)
#     @filename = filename
#   end
#
#   def open_file
#     file = File.new()
# end
require './lib/card'
file_lines = []
File.foreach("./lib/cards.txt") do |line|
  if line.strip != ""
    card = line.strip
  end
  if card
    file_lines << card
  end
end

seperated = []
file_lines.each do |line|
  seperated << line.split(',')
end

seperated_hash = seperated.to_h do |card|
  ["card #{seperated.find_index(card)+1}" , card]
end

card_attribute_array = []
card_attributes_keys = [:question, :answer, :category]
seperated_hash.each do |k,v|
  card_attribute_array << card_attributes_keys.zip(v).to_h
end

@card_attribute_hash = card_attribute_array.to_h do |card|
  [:"card_#{card_attribute_array.find_index(card)+1}" , card]
end

@cards = []
def pull_cards
  @card_attribute_hash. each do |k,v|
    @cards << Card.new(v[:question], v[:answer], v[:category])
  end
end
pull_cards




require "pry"; binding.pry
