require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Which noble gas has only two protons?", "helium", :elements)
card_2 = Card.new("Which element is denoted by the symbol Hg?", "mercury", :elements)
card_3 = Card.new("Which element has an atomic number of 8?", "oxygen", :elements)
card_4 = Card.new("Which element comes next after boron?", "carbon", :elements)
card_5 = Card.new("How many football players from each team are allowed on the field for a play?", "11", :football)
card_6 = Card.new("What is the name of the player position that most often passes the football?", "quarterback", :football)
card_7 = Card.new("How many points is a made field goal worth?", "3", :football)
card_8 = Card.new("What city is hosting Super Bowl 53?", "miami", :football)

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
