require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class FlashCards
  def initialize
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
  end

  def start
    puts "Welcome! You're playing with 4 cards."
    puts "-------------------------------------------------"
    puts "This is card number 1 out of 4"
    puts "Question: What is 5 + 5?"
    puts "10"
    puts "Correct!"
    puts "This is card number 2 out of 4."
    puts "Question: What is Rachel's favorite animal?"
    puts "panda"
    puts "Incorrect."
    puts "This is card number 3 out of 4."
    puts "Question: What is Mike's middle name?"
    puts "Lancelot"
    puts "Correct!"
    puts "This is card number 4 out of 4."
    puts "Question: What cardboard cutout lives at Turing?"
    puts "Justin Bieber"
    puts "Correct!"
    puts "****** Game over! ******"
    puts "You had 3 correct guesses out of 4 for a total score of 75%."
    puts "STEM - 100% correct"
    puts "Turing Staff - 50% correct"
    puts "Pop Culture - 100% correct"
  end
end

flashcards = FlashCards.new
flashcards.start
