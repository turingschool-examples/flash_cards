require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


card_1 = Card.new("True or False: 8 is an example of a float.", "False", :Data_types)
card_2 = Card.new("True or False: 'Pandas are cool' is an example of a String.", "True", :Data_types)
card_3 = Card.new("True or False: A boolean in ruby will return True or False.", "True", :Data_types)
card_4 = Card.new("True or False: 'bananas' == 'bananas' will return false.", "False", :Conditionals)
card_5 = Card.new("True or False: 'apple' != 'watermelon' will return true.", "True", :Conditionals)
card_6 = Card.new("True or False: 'watermelon'.length > 6 will return false.", "False", :Conditionals)
card_7 = Card.new("True or False: Horses can sleep standing up.", "True", :Animals)
card_8 = Card.new("True or False: Camels store water in their humps.", "False", :Animals)
card_9 = Card.new("True or False: Female reindeer have antlers.", "True", :Animals)

cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9]

deck = Deck.new(cards)
round = Round.new(deck)


def start(round)
  card_total = round.deck.count
  counter = 0

  puts "Welcome! You're playing with #{card_total} cards."
  puts "-" * 50

  while(counter < card_total)
    counter += 1
    puts "This is card number #{counter} out of #{card_total} cards."
    puts "Question: #{round.current_card.question}"
    print ":"
    player_guess = gets.chomp
    round.take_turn(player_guess.capitalize)
    puts round.turns.last.feedback
  end

puts  "****** GAME OVER ******"
puts  "You had #{round.number_correct} guesses out #{card_total} for a total score of #{round.percent_correct.to_i}%."
puts "Data_types - #{round.percent_correct_by_category(:Data_types)}% correct"
puts "Conditionals - #{round.percent_correct_by_category(:Conditionals)} % correct"
puts "Animals - #{round.percent_correct_by_category(:Animals)} % correct"
end

start(round)
