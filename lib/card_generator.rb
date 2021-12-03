#iteration 4
require './lib/card'

lines = []
IO.foreach('./more_questions.txt') {
  |line|
  lines << a = line.split(',')
}

# puts lines # each element follows #question, #answer, #category # array of 25


# puts lines[0].length # Array of arrays

x = Hash[(0..lines.size).zip lines]

x.delete(26)
x.delete(25)


cards_jeopardy = []
x.each do |key, value|
  cards_jeopardy << key = Card.new(value[0], value[1], value[2].to_sym)
end
puts cards_jeopardy[0].category.class

# puts a.category #works


#As Hash

# lines = {}
# counter = 0
# IO.foreach('./more_questions.txt') {
#   |line, counter|
#    lines[counter] = line.split(',')
# }

#puts lines # each element follows #question, #answer, #category # array of 25


#puts lines[0].length # Array of arrays

# puts lines
#
#
# a = Card.new(lines[0][0], lines[0][1], lines[0][2])
