require "./card"
require "pry"

card_1 = Card.new("How many players are on the court for 1 team?", 5, Basketball)
card_1.question("How many players are on the court for 1 team?")
card_1.answer(5)
card_1.category("Basketball")

print card_1.question
 if answer == 5
   puts "Nice work!"
 elsif answer != 5
   puts "Try again!"
   puts card_1.question
 elsif answer = 5
   puts "Way to go!"
 else answer != 5
   puts "Let's move on"

binding.pry
