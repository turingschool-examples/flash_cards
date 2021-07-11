require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'


def start

  card_set = CardGenerator.new('./lib/cards.txt').make_cards
  deck_1 = Deck.new(card_set)
  round_1 = Round.new(deck_1)
  original_num_cards = deck_1.count

  if deck_1.count == 0
    puts "** Please add cards to the cards.txt file to play! **"
    return nil
  end

  puts "Welcome! You are playing with #{deck_1.count} cards!"
  (deck_1.count).times {
    puts "-------------------------------------------------"
    puts "This is card number #{round_1.used_cards.length + 1} out of #{original_num_cards}"
    puts "#{round_1.current_card.question}"

    guess = gets.chomp.upcase
    puts round_1.take_turn(guess).feedback #tricky placement as this cycles through the deck. Maybe use conditional?

  }

  categories = round_1.used_categories

  puts "****** Game Over! ******"
  puts "You had #{round_1.number_correct} correct guesses out of #{original_num_cards}, for a total score of #{round_1.percent_correct}%"

  categories.each do |type|
    puts "#{type} - #{round_1.percent_correct_by_category(type)}% correct"
  end

end
start
