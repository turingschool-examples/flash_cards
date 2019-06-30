require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

card_collection_1 = CardGenerator.new.cards_from_file

deck_1 = Deck.new(card_collection_1)

round_1 = Round.new(deck_1)

puts " "
puts " "

def start(round)
  deck_of_cards = round.deck.cards
  puts "Welcome! You're playing with #{deck_of_cards.size} cards!"
  puts "-" * 40
  deck_of_cards.each do |card|
    card_number = deck_of_cards.index(card) + 1
    puts "You're on card number #{card_number} of #{deck_of_cards.size}."
    puts "Question: #{card.question}"
    print "> "
    user_guess = gets.chomp.downcase
    round.take_turn(user_guess)
    current_turn = round.turns[deck_of_cards.index(card)]
    puts current_turn.feedback
  end
  puts "******** Game Over! ********"
  puts "You correctly answered #{round.number_correct} out of #{deck_of_cards.size} cards!"
  puts "Your final score is #{round.percent_correct}!"
  categories = deck_of_cards.map do |card|
    card.category
  end
  categories.uniq.each do |category|
    puts "You scored #{round.percent_correct_by_category(category)} on #{category} questions."
  end
end

start(round_1)
