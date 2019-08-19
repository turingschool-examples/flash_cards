require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is my dogs name?", "foxy", :foxy)
card_5 = Card.new("what is foxys instagram", "foxythebear", :foxy)
card_6 = Card.new("how old is foxy?", "5", :foxy)
card_7 = Card.new("What breed is foxy?", "Australian Cattledog mix", :foxy)
card_8 = Card.new("how long will foxy live", "forever", :foxy)

card_collection_1 = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]

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
    user_guess = gets.chomp
    last_turn = round.take_turn(user_guess)
    puts last_turn.feedback
  end
  puts "******** Game Over! ********"
  puts "You correctly answered #{round.number_correct} out of #{deck_of_cards.size} cards!"
  puts "Your final score is #{round.percent_correct.round}%!"
  categories = deck_of_cards.map do |card|
    card.category
  end
  categories.uniq.each do |category|
    puts "You scored #{round.percent_correct_by_category(category).round}% on #{category} questions."
  end
end

start(round_1)
