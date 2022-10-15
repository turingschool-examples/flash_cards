require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/CardGenerator'

p 'Welcome to Flash Cards! Please enter the number and then Enter for the question set you would like!'
p '1 - Turing Questions'
p '2 - BradyTech Questions'
p '3 - State Capitols'
p '4 - Upload your own file - WARNING, THIS FUNCTION IS PROTOTYPE AND REQUIRES AN EXACT FILEPATH'
p 'USE AT OWN RISK'

player_choice = gets.chomp
flash_card_input = if player_choice == '1' then './lib/cards.txt'
                    elsif player_choice == '2' then './lib/cards2.txt'
                    elsif player_choice == '3' then './lib/cards3.txt'
                    elsif player_choice == '4' then p 'Input filepath now'
                      gets.chomp
                    else p 'Please choose a valid selection, 1 - 4!'
                    end

card_set = CardGenerator.new(flash_card_input) 
card_set.make_cards
deck_1 = Deck.new(card_set.cards)
round = Round.new(deck_1)

p "Welcome! You're playing with #{round.deck.count} cards."
p '-------------------------------------------------------'

while round.deck.count > 0

  p "This is card number #{round.turns.length + 1} out of #{round.deck.count + round.turns.count}."
  p "Question: #{round.current_card.question}"

  answer_1 = gets.chomp

  round.take_turn(answer_1)

  p round.turns[-1].feedback
end

p '***** Game Over! ******'
p "You had #{round.number_correct} out of #{round.turns.count} for a total score of #{round.percent_correct}%."

round.categories_present.each do |category|
  p "#{category} - #{round.percent_correct_by_category(category)}% correct"
end
