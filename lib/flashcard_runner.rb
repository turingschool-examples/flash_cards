# Richard Tillies
# October 15, 2021
# Card class
# ~/turing/1module/projects/flash_cards/lib/flashcard_runner.rb

require './card'
require './turn'
require './deck'
require './round'
require './card_generator'

def header(text)
  len = text.length
  puts(text)
  puts("-" * (len+5))
end

def this_card(num)
  puts("This is card number #{num} out of #{@counter}.")
  puts("Question: #{@round.current_card.question}")
  print(">> ")
  guess = gets.chomp
  turn = @round.take_turn(guess)
  puts turn.feedback
end

def display_results
  header("*" * 6 + " GAME OVER " + "*" * 6)
  puts "Total Questions: #{@counter}"
  puts "Number Correct: #{@round.number_correct}"
  puts "Percent Correct: #{@round.percent_correct.round(2)}%"
  puts

  header("*" * 6 + " RESULTS BY CATEGORY " + "*" * 6)
  @categories.each do |key, value|
    puts "#{key} %: #{@round.percent_correct_by_category(key).round(2)}%"
  end
end

# Local Variables
card_1 = Card.new("What is the capital of Alaska?",
   "Juneau", :Geography)
card_2 = Card.new("A ____ triangle that contains a 90 degree angle.",
   "Right", :STEM)
card_3 = Card.new("What is the capital of North Carolina?",
    "Raleigh", :Geography)
card_4 = Card.new("What object-oriented programming language is also a precious gem?",
   "Ruby", :STEM)

filename = "cards.txt"
cards = CardGenerator.new(filename).cards

# cards = [card_1, card_2, card_3, card_4]
@deck = Deck.new(cards)
@counter = @deck.count
@round = Round.new(@deck)
@categories = {}

# Category List
# @categories = {}
@deck.cards.each do |card|
  p card.category
  if (@categories.has_key?(card.category))
    @categories[card.category] += 1
  else
    @categories[card.category] = 1
  end
end
p "Number of categories: #{@categories.length}"


## Main Program
header("Welcome! You're playing with #{@deck.count} cards.")

(1..@deck.count).each do |num|
  this_card(num)
end

display_results

# require "pry"; binding.pry
