puts "Welcome! You're playing with 4 cards.\r\n This is card number 1 out of 4. \r\n Question: What is 5 + 5?"

print "> "
answer = $stdin.gets.chomp

if answer == "10"
  puts "Correct!"
elsif
  puts "Incorrect."
end

puts "This is card number 2 out of 4."
puts "Question: What is Rachel's favorite animal?"

print "> "
answer = $stdin.gets.chomp

if answer == "panda"
  puts "Incorrect."
end

puts "This is card number 3 out of 4."
puts "Question: What is Mike's middle name?"

print "> "
answer = $stdin.gets.chomp

if answer == "nobody knows"
  puts "Correct!"
end

puts "This is card number 4 out of 4."
puts "Question: What cardboard cutout lives at Turing?"

print "> "
answer = $stdin.gets.chomp

if answer == "Justin Bieber"
  puts "Correct!"
end

  puts "****** Game over! ******
You had 3 correct guesses out of 4 for a total score of 75%."
"{}STEM - #{percent_correct} correct"
"Turing Staff - #{percent_correct} correct"
"Pop Culture - #{percent_correct} correct"
