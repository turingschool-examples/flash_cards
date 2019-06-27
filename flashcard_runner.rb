require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Which noble gas has only two protons?", "helium", :Elements)
card_2 = Card.new("Which element is denoted by the symbol Hg?", "mercury", :Elements)
card_3 = Card.new("Which element has an atomic number of 8?", "oxygen", :Elements)
card_4 = Card.new("Which element comes next after boron?", "carbon", :Elements)
card_5 = Card.new("How many football players from each team are allowed on the field for a play?", "11", :Football)
card_6 = Card.new("What is the name of the player position that most often passes the football?", "quarterback", :Football)
card_7 = Card.new("How many points is a made field goal worth?", "3", :Football)
card_8 = Card.new("What city is hosting Super Bowl 53?", "miami", :Football)

card_collection_1 = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]

deck_1 = Deck.new(card_collection_1)

round_1 = Round.new(deck_1)

def start(round)
  puts "Welcome! You're playing with #{round.deck.cards.size} cards!"
  puts "-" * 40
  round.deck.cards.each do |card|
    card_number = round.deck.cards.index(card) + 1
    current_question = card.question
    puts "You're on card number #{card_number} of 8."
    puts "Question: #{current_question}"
    print "> "
    user_guess = gets.chomp.downcase
    round.take_turn(user_guess)
    puts round.turns[round.deck.cards.index(card)].feedback
  end
  puts " ****** Game Over! ****** "
  puts "You correctly answered #{round.number_correct} out of #{round.deck.cards.size} cards!"
  puts "That means you scored #{round.percent_correct}"
  puts "You scored #{round.percent_correct_by_category(:Football)} on football questions!"
  puts "You scored #{round.percent_correct_by_category(:Elements)} on element questions!"
end

start(round_1)
