require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# start or something

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "jabberwocky", "Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Beiber", "Pop Culture")

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  puts welcome_message(round)

  until round.current_card == nil
    puts card_position(round)
    puts current_question(round)
    guess = player_input
    round.take_turn(guess)
    puts feedback(round)
  end

  print_results(round)
end

def welcome_message(round)
  "Welcome! You're playing with #{round.deck.cards.count} cards.\n-------------------------------------------------"
end

def card_position(round)
  "This is card number #{round.current_index + 1} out of #{round.deck.cards.count}."
end

def current_question(round)
  round.current_card.question
end

def player_input
  gets.chomp
end

def feedback(round)
  round.turns.last.feedback
end

def print_results(round)
  puts game_over
  puts total_score(round)
  puts category_scores(round)
end

def game_over
  "****** Game over! ******"
end

def total_score(round)
  "You had #{round.number_correct} correct guesses out of #{round.deck.cards.count} for a total score of #{round.percent_correct.to_i}%."
end

def category_scores(round)
  category_array(round).map do |category|
    "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
  end
end

def category_array(round)
  category_array = round.turns.map { |turn| turn.card.category }
  category_array.uniq
end

start(round)
