# class CardGenerator
#
#   attr_reader :filename, :cards
#   def initialize(filename)
#   @filename = filename
#   @cards = []
#   end
#
#   def collect
#     array = File.open(@filename, "r") do |f|
#       f.readlines.map(&:chomp)
#     end
#     # cards.close
#     strings = []
#     array.each do |string|
#       strings << string
#     end
#     nested_strings = strings.map do |string|
#       string.split(',')
#     end
#     nested_strings.map do |card|
#       question = card[0]
#       answer = card[1]
#       category = card[2]
#       card = Card.new(question, answer, category)
#     end
#     generate
#   end
#
#   def generate
#    @cards << collect
#   end
#
#
#
#
#
#
# # turn cards.txt into an array.
# # then Get each element of the array as a separate array.
# # then split those arrays by comma.
# # then use those elements as question answer category
# # to initialize a Card
#
#
#
# end
