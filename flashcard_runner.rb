require './lib/round'

card_1 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("What is the capital of Kansas?", "Topeka", :Geography)
card_4 = Card.new("What is 4 + 4?", 8, :Math)
card_5 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

round = Round.new(deck)

puts "Enter 'Start' - To Begin Flashcards"
puts "Enter 'End' - To End Flashcards\n\n"

print "> "
start = $stdin.gets.chomp

if start.capitalize == "Start"
  puts " "
  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-" * 60
