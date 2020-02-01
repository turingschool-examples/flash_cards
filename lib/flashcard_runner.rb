require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'


filename = './lib/cards.txt'
cards = CardGenerator.new(filename)
card_total = cards.cards.length
new_deck = Deck.new(cards.cards)
new_round = Round.new(new_deck)

puts "-------------------------------------------------"
puts "Welcome! You're playing with #{card_total} cards."
puts "-------------------------------------------------"

loop do
  if new_round.turns.length == 0
    puts "This card is number 1 out of #{card_total}."
    new_round.start
    puts new_round.current_card.question
    print "> "
    user_guess_input = gets.chomp
    new_turn = Turn.new(user_guess_input, new_deck.cards.first)
    new_round.take_turn(new_turn.guess)
    puts new_turn.feedback
    new_round.current_card
  else
    puts "This card is number #{new_round.turns.length + 1} out of #{card_total}."
    puts new_round.current_card.question
    print "> "
    user_guess_input = gets.chomp
    new_turn = Turn.new(user_guess_input, new_round.current_card)
    new_round.take_turn(new_turn.guess)
    puts new_turn.feedback
    new_round.current_card

    if new_round.turns.length == 4
      break
    end
  end
end

puts  "****** Game over! *******"
puts "You had #{new_round.number_correct} out of 4 for a total score of #{new_round.percent_correct} %."
puts "Geography - #{new_round.percent_correct_by_category("Geography")} % correct."
puts "Pop Culture - #{new_round.percent_correct_by_category("Pop Culture")} % correct."
