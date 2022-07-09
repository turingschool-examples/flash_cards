require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("Broccoli, cabbage, and brussel sprouts are all the same species, True or False?", "True", :Biology)
@card_2 = Card.new("What is the common name of Canis lupus familiaris?", "Dog", :Biology)
@card_3 = Card.new("What element has the atomic number of 1?", "Hydrogen", :Chemistry)
@card_4 = Card.new("What is the only metal that is liquid at room temperature?", "Mercury", :Chemistry)
@card_5 = Card.new("Which planet in our solar system has the most moons?", "Saturn", :Astronomy)
@card_6 = Card.new('Which planet is generally known as the "Morning Star"?', "Venus", :Astronomy)
@card_7 = Card.new("Neocaridina is the genus name of what kind of animal?", "Shrimp", :Biology)

@deck_1 = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7
  ])

@round = Round.new(@deck_1)

def start
  puts "Welcome! You're playing with #{@round.deck.cards.length} cards."
  puts "~~~~-------------------------------------------~~~~"
  puts "This is card number #{@round.turns.length + 1} out of #{@round.deck.cards.length}."
  puts "Question: #{@round.current_card.question}"
  current_turn = @round.take_turn(gets.chomp.capitalize)
  current_turn.feedback
  until @round.turns.length == @round.deck.cards.length do
    puts "-------------------------------------------------"
    puts "This is card number #{@round.turns.length + 1} out of #{@round.deck.cards.length}."
    puts "Question: #{@round.current_card.question}"
    current_turn = @round.take_turn(gets.chomp.capitalize)
    current_turn.feedback
  end
  puts "****** Game over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.cards.length} for a total score of #{@round.percent_correct.round(0)}%."
  puts "Biology - #{@round.percent_correct_by_category(:Biology).round(0)}% correct"
  puts "Chemistry - #{@round.percent_correct_by_category(:Chemistry).round(0)}% correct"
  puts "Astronomy - #{@round.percent_correct_by_category(:Astronomy).round(0)}% correct"
end

start
