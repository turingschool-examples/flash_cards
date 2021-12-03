#iteration 4
require './lib/card'

lines = []
IO.foreach('./more_questions.txt') {
  |line|
  lines << a = line.split(',')
}

puts lines # each element follows #question, #answer, #category # array of 25


puts lines[0].length # Array of arrays
