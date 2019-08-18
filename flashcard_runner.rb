require './lib/card'
require './lib/card_manager'
require './lib/deck'
require './lib/turn'
require './lib/round'

def start
  file_name = './data/deck_1.txt'
  card_manager = CardManager.new(file_name)
  deck = Deck.new(card_manager.cards_by_file[file_name])
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


# Helper methods

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
