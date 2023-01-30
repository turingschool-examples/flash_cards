require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Who is my creator?", "Rontron", :People)
card_2 = Card.new("Who am I?", "NEPTR", :People)
card_3 = Card.new("Who says 'I'm a big baby that can dance like a man'?", "Finn", :People)
card_4 = Card.new("Where is the dopest new place to train for outdoor skating?", "Aurora Reservoir", :Places)
card_5 = Card.new("Where does Gamelan Gong Kebyar come from?", "Bali", :Places)
card_6 = Card.new("How many hours is the Miami UltraSkate", "24", :SkateEvents)
card_7 = Card.new("Where does the A2A roadskate begin?", "Athens, GA", :SkateEvents)

deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7])

def print_question(round)
  puts "This is card number #{round.turns.length + 1} out of #{round.deck.count}."
  puts "Question: #{round.current_card.question}"
end

def print_score(round)
  puts "*** Game Over! ***"
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct.to_i}%."
  puts "People - #{round.percent_correct_by_category(:People).to_i}% correct"
  puts "Places - #{round.percent_correct_by_category(:Places).to_i}% correct"
  puts "SkateEvents - #{round.percent_correct_by_category(:SkateEvents).to_i}% correct"
end

def start(deck)
  round = Round.new(deck)
  puts "Welcome! You're playing with #{round.deck.count} cards" 
  puts "-----------------------------------------------"

  while round.turns.length < deck.count do
    print_question(round)
    guess = gets.chomp
    round.take_turn(guess.strip)
    puts round.turns.last.feedback 
  end

  print_score(round)
end

start(deck)
