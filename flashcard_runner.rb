require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'

@card("What is 5 + 5?", 10, :STEM)
@card("What is Rachel's favorite animal?", "Dog", "Turing Staff")
@card("What is Mike's middle name?", "nobody knows", "Turing Staff")
@card("What cardboard cutout lives at Turing", "Justin Bieber", "Turing Staff")


puts "Welcome! You're playing with 4 cards."
puts "-------------------------------------------------"
puts "This is card number 1 out of 4."
puts "Question: What is 5 + 5?"
gets
if gets == 10
  puts "Correct!"
else
  puts "Incorrect."
end
puts "This is card number 2 out of 4."
puts "Question: What is Rachel's favorite animal?"
gets
puts "Incorrect."
puts "This is card number 3 out of 4."
puts "Question: What is Mike's middle name?"
gets
puts "Correct!"
puts "This is card number 4 out of 4."
puts "Question: What cardboard cutout lives at Turing?"
gets
puts "Correct!"
# I know that this is the incorrect way to do this, I am having a hard time
# understanding the gets command interaction. How to call it or reference it.
