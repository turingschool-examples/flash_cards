require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

# card_1 = Card.new("Question: What company produces the Destroyer disc golf disc?", "Innova", :disc_golf)
# card_2 = Card.new("Question: Is a Firebird overstable or understable?", "overstable", :disc_golf)
# card_3 = Card.new("Question: How many meters from the basket must you be to legally perform a \"jump putt?\"", "10", :disc_golf)
# card_4 = Card.new("Question: What is the term that refers to scoring one less than par on a hole?", "birdie", :disc_golf)
# card_5 = Card.new("Finish the quote:\n\"Just when I think you couldn't possibly be any dumber, you go and do something like this, and totally _______ yourself!\"", "redeem", :movie_quotes)
# card_6 = Card.new("Finish the quote:\n\"Over the line! Mark it _______, Dude.\"", "zero", :movie_quotes)
# card_7 = Card.new("Finish the quote:\n\"But this being a .44 Magnum, the most powerful handgun in the world...you've got to ask yourself one question: 'Do I feel ______?' Well, do ya, punk?\"", "lucky", :movie_quotes)
# card_8 = Card.new("Finish the quote:\n\"I'm going to make him an offer he can't _______.\"", "refuse", :movie_quotes)
# cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]
# cards = cards.shuffle

cards = CardGenerator.new("cards.txt").make_cards(",")
num_cards = cards.length
categories = cards.map {|card| card.category}.uniq
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.cards.length} cards."
puts "_" * 50

num_cards.times do |index|
  puts "This is card number #{index + 1} of #{num_cards}"
  print round.current_card.question + "\n"
  answer = gets.chomp
  round.take_turn(answer)
  puts round.turns.last.feedback
  puts ""
  if index + 1 == num_cards
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct answers out of #{num_cards} for a total score of #{round.percent_correct}%."
    categories.each do |category|
      puts "#{category} - #{round.percent_correct_by_category(category)} correct"
    end
  end
end
