require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'
require './lib/card_generator.rb'

def card_array
  card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North North West",:STEM)
  card4 = Card.new("What is 5 divided by 2?","2.5",:Math)
  card5 = Card.new("Sally is 2 years old. Her sister is 6. How old will sally be when she is exactly half of her sister's age?","4",:Math)
  [card1,card2,card3,card4,card5]
end

def play_game
  cards = CardGenerator.new("./cards.txt").cards
  deck = Deck.new(cards)
  round = Round.new(deck)
  number_of_cards = deck.count
  welcome_message = "Welcome! You're playing with #{number_of_cards} cards.\n---------------------------------------------------"
  turn_number = 1
  puts welcome_message

  while turn_number <= number_of_cards
    puts "This is card number #{turn_number} out of #{number_of_cards}"

    puts round.current_card.question
    turn = round.take_turn(gets.chomp)

    puts turn.feedback
    puts ""
    turn_number += 1
  end

  puts "********** Game over! **********"
  puts "You had #{round.number_correct} out of #{number_of_cards} for a total score of #{round.percent_correct}%."
  round.categories_in_deck.each do |category|
    puts "#{category.to_s} - #{round.percent_correct_by_category(category)}% correct."
  end
end

play_game
