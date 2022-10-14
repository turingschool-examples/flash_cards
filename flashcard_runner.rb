class Start

  p "Welcome to Flashcards!"
  p "Please enter your name"
  name = gets.chomp

  p "Welcome '#{name}' ! You're playing with 4 cards."
  p "-------------------------------------------------"
  p "This is card number 1 out of 4."
  p "Question: What is 5 + 5?"
  guess = gets.chomp
end
