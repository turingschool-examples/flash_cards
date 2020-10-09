require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

puts "Choose a flashcard deck"
puts "Enter 1 or 2"
puts "1. Turing Flashcards"
puts "2. CNA Flashcards"

choose_deck = gets.chomp.to_i
if choose_deck == 1
  cards = CardGenerator.new('./file.txt').cards
  deck = Deck.new(cards)
  round = Round.new(deck)
  round.start
elsif choose_deck == 2
  card_1 = Card.new("What are acceptable reasons for discharge or transfer?", "Medical reasons", :CLIENT)
  card_2 = Card.new("Patients have the right to be free from restraints unless what is obtained?", "Authorization order", :CLIENT)
  card_3 = Card.new("the ability to understand the feelings of another without pitying them", "Empathy", :COMMUNICATION)
  card_4 = Card.new("The “Resident’s Bill of Rights” was put out by which group?", "AHA", "Ethical Behavior")
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)
  round.start
else
  puts "Error. Incorrect input. Try again."
end
