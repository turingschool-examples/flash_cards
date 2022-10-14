require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/CardGenerator'


p 'Welcome to Flash Cards! If you have a properly formatted file to use'
p 'enter that now, or press Enter to use the default cards!'
flash_card_input = gets.chomp
card_set = CardGenerator.new(flash_card_input)
card_set = CardGenerator.new(default = './lib/cards.txt')
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
