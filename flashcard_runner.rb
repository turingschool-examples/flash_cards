

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop culture")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

def start(round)
  welcome_message(round.deck.count)

  round.deck.cards.each do |card|
    turn_message(round)
    user_guess(round)
    puts round.turns.last.feedback
  end
  game_over(round)
end

def welcome_message(count)
  puts "Welcome! You're playing with #{count} cards.
  -------------------------------------------------"
end

def user_guess(round)
  guess = gets.chomp
  round.take_turn(guess)
end

def turn_message(round)
  puts "This is card number #{round.turns.length + 1} out of #{round.deck.count}.
  Question: #{round.current_card.question}"
end

def game_over(round)
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total of #{round.percent_correct}%."
  get_categories(round).each do |category|
    category_message(category, round)
  end
end

# def get_categories(round)
#   unique_categories = []
#   round.turns.each do |turn|
#     unique_categories << turn.card.category if !(unique_categories.include?(turn.card.category))
#   end
#   unique_categories
# end

def category_message(category, round)
  puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
end
start(round)
