require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

def start

  filename = "cards.txt"

  cards = CardGenerator.new(filename).cards

  deck = Deck.new(cards)

  round = Round.new(deck)

  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-" * 40

  until round.current_card_position == round.deck.cards.count
    puts "This is card number #{round.current_card_position+1} of #{round.deck.count}."
    puts "Question: #{round.deck.cards[round.current_card_position].question}"
    print "Type answer then press enter: "
    user_guess = gets.chomp
    new_turn = round.take_turn(user_guess)
    puts "#{round.turns.last.feedback}"
    puts "-" * 40
  end

  puts "*" * 10 + " GAME OVER! " + "*" * 10
  puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct.round(2)}%."

  round.deck.get_all_categories.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
  end
end

start
