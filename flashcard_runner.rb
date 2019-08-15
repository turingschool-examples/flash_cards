require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'





def start

  # Card, Deck, and Round setup
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  card_4 = Card.new("Where is Turing based out of?", "Denver", :Geography)
  card_5 = Card.new("What is 5 + 5?", "10", :STEM)
  card_6 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff".to_sym)
  card_7 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff".to_sym)
  card_8 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture".to_sym)
  cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]
  deck = Deck.new(cards)
  round = Round.new(deck)
  total_cards = round.deck.count
  
  puts welcome_message(total_cards)

  turn_number = 1
  while turn_number <= total_cards
    puts "This card is number #{turn_number} of #{total_cards}."
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp
    puts round.take_turn(guess).feedback
    turn_number += 1
  end

  puts game_over_message
  puts "You had #{round.number_correct} correct guesses out of #{total_cards} for a total score of #{round.percent_correct.round.to_i}%"
  turns_by_categories_hash = categories_turn_hash(round.turns)
  turns_by_categories_hash.each_key { |key| puts "#{key} - #{round.percent_correct_by_category(key).round.to_i}% correct" }
end

def welcome_message(total_cards)
  message       = "Welcome! You're playing with #{total_cards} cards."
  message_break = "-" * message.length
  message + "\n" + message_break
end

def game_over_message
  message = " Game Over! "
  message = message.center(message.length + 12, "*")
end

def categories_turn_hash(turns)
  return_hash = {}
  turns.each do |turn|
    if return_hash.has_key?(turn.card.category)
      return_hash[turn.card.category].push(turn)
    else
      return_hash[turn.card.category] = [turn]
    end
  end
  return_hash
end

start
